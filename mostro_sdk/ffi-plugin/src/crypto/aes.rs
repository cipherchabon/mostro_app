use crate::{
    common::utils::{base64_decode, base64_encode},
    prelude::*,
};
use aes_gcm_siv::{
    self,
    aead::{generic_array::GenericArray, Aead},
    Aes256GcmSiv, KeyInit,
};
use rand::{rngs::OsRng, RngCore};
use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize)]
pub struct EncryptedData {
    // this is the encrypted data
    cipher_value: String,
    // this is the key used to encrypt the data
    encryption_key: String,
    // this is the nonce
    nonce: String,
}

/// Encrypts data using the AES-GCM-SIV algorithm.
///
/// # Safety
///
/// This function is unsafe because it operates on raw pointers.
///
/// The caller is responsible for:
/// - Ensuring both `key` and `data` are valid pointers to null-terminated
///  C strings.
/// - key shoud be a base64 encoded string
/// - Properly freeing the `string` and `error_ptr` fields of the returned
/// `StringResult` struct on the Dart side.
///
/// To free the strings in Dart, you should use `ffi`'s `calloc.free` function.
#[no_mangle]
pub unsafe extern "C" fn encrypt(key: *const c_char, data: *const c_char) -> StringResult {
    // Convert C strings to Rust strings
    let key = match CStr::from_ptr(key).to_str() {
        Ok(key) => key,
        Err(_) => return StringResult::err("Failed to decode key".to_string()),
    };
    let data = match CStr::from_ptr(data).to_str() {
        Ok(data) => data,
        Err(_) => return StringResult::err("Failed to decode data".to_string()),
    };

    let key = match base64_decode(key) {
        Ok(key) => key,
        Err(_) => return StringResult::err("Failed to decode key".to_string()),
    };

    // Check if the key is the correct length
    // AES-GCM-SIV requires a 32-byte (256-bit) key
    if key.len() != 32 {
        return StringResult::err("Invalid key length".to_string());
    }

    // Create a `Key` instance
    let key_bytes = GenericArray::from_slice(&key);

    // Create a new AES-GCM-SIV instance
    let cipher = Aes256GcmSiv::new(key_bytes);

    // Create a new random nonce
    let mut nonce = [0u8; 12]; // GCM-SIV recommends a 12-bytes (96 bits) nonce
    OsRng.fill_bytes(&mut nonce);
    let nonce = GenericArray::from_slice(&nonce);

    // Encrypt the data
    let ciphertext = match cipher.encrypt(nonce, data.as_ref()) {
        Ok(ciphertext) => ciphertext,
        Err(_) => return StringResult::err("Failed to encrypt data".to_string()),
    };

    // Create an EncryptedData instance
    let encrypted_data = EncryptedData {
        cipher_value: base64_encode(ciphertext),
        encryption_key: base64_encode(key),
        nonce: base64_encode(nonce),
    };

    // Convert EncryptedData to JSON
    let json = serde_json::to_string(&encrypted_data).unwrap();

    StringResult::ok(json)
}

/// Decrypts data using the AES-GCM-SIV algorithm.
///
/// # Safety
///
/// This function is unsafe because it operates on raw pointers.
///
/// The caller is responsible for:
/// - Ensuring both `key` and `data` are valid pointers to null-terminated
/// C strings.
/// - Properly freeing the `string` and `error_ptr` fields of the returned
/// `StringResult` struct on the Dart side.
///
/// To free the strings in Dart, you should use `ffi`'s `calloc.free` function.
#[no_mangle]
pub unsafe extern "C" fn decrypt(encrypted_data_json: *const c_char) -> StringResult {
    // Convert C strings to Rust strings

    let encrypted_data_json = match CStr::from_ptr(encrypted_data_json).to_str() {
        Ok(encrypted_data_json) => encrypted_data_json,
        Err(_) => return StringResult::err("Failed to decode encrypted data".to_string()),
    };

    // Parse EncryptedData from JSON
    let encrypted_data: EncryptedData = match serde_json::from_str(encrypted_data_json) {
        Ok(encrypted_data) => encrypted_data,
        Err(_) => return StringResult::err("Failed to parse encrypted data".to_string()),
    };

    let key = encrypted_data.encryption_key;

    // Validate key length
    if key.len() != 32 {
        return StringResult::err("Invalid key length".to_string());
    }

    // Create a `Key` instance
    let key = GenericArray::from_slice(key.as_bytes());

    // Create a new AES-GCM-SIV instance
    let cipher = Aes256GcmSiv::new(key);

    // Decode the ciphertext and nonce from base64
    let value = match base64_decode(&encrypted_data.cipher_value) {
        Ok(value) => value,
        Err(_) => return StringResult::err("Failed to decode ciphertext".to_string()),
    };
    let nonce = match base64_decode(&encrypted_data.nonce) {
        Ok(nonce) => nonce,
        Err(_) => return StringResult::err("Failed to decode nonce".to_string()),
    };

    // Validate nonce length
    if nonce.len() != 12 {
        return StringResult::err("Invalid nonce length".to_string());
    }

    // Create a `Nonce` instance
    let nonce = GenericArray::from_slice(&nonce);

    // Decrypt the data
    let value = match cipher.decrypt(nonce, value.as_ref()) {
        Ok(value) => value,
        Err(_) => return StringResult::err("Failed to decrypt data".to_string()),
    };

    // Convert plaintext to a string
    let value = match String::from_utf8(value) {
        Ok(value) => value,
        Err(_) => return StringResult::err("Failed to convert plaintext to string".to_string()),
    };

    StringResult::ok(value)
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::ffi::{CStr, CString};

    #[test]
    fn test_encrypt_decrypt() {
        let key = CString::new("01234567890123456789012345678901").unwrap();
        let data = CString::new("Hello, world!").unwrap();

        let encrypted_data = unsafe { encrypt(key.as_ptr(), data.as_ptr()) };
        assert!(encrypted_data.is_ok());

        let decrypted_data = unsafe { decrypt(encrypted_data.ok_ptr) };
        assert!(decrypted_data.is_ok());

        let decrypted_data = unsafe {
            CStr::from_ptr(decrypted_data.ok_ptr)
                .to_string_lossy()
                .into_owned()
        };

        assert_eq!(decrypted_data, "Hello, world!");
    }
}
