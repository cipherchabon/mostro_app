use crate::{common::utils::base64_encode, prelude::*};
use argon2::{self, password_hash::SaltString, PasswordHash, PasswordHasher, PasswordVerifier};
use rand::rngs::OsRng;

/// Generates a random salt using the Argon2 algorithm.
#[no_mangle]
pub extern "C" fn generate_salt() -> *const c_char {
    let salt = SaltString::generate(&mut OsRng);
    let salt = CString::new(salt.as_str()).unwrap();
    salt.into_raw()
}

/// Hashes a password with a provided salt using the Argon2 algorithm.
///
/// # Safety
///
/// This function is unsafe because it operates on raw pointers.
///
/// The caller is responsible for:
/// - Ensuring both `password` and `salt` are valid pointers to null-terminated
///   C strings.
/// - Properly freeing the `string` and `error_ptr` fields of the returned
///   `StringResult` struct on the Dart side.
///
/// To free the strings in Dart, you should use `ffi`'s `calloc.free` function.
/// Make sure you only free the strings when they are no longer needed, as doing
/// so earlier will likely cause your program to crash.
#[no_mangle]
pub unsafe extern "C" fn hash_password(
    password: *const c_char,
    salt: *const c_char,
) -> StringResult {
    let password = match CStr::from_ptr(password).to_str() {
        Ok(password) => password,
        Err(_) => return StringResult::err("Failed to decode password".to_string()),
    };

    let salt = match CStr::from_ptr(salt).to_str() {
        Ok(salt) => salt,
        Err(_) => return StringResult::err("Failed to decode salt".to_string()),
    };

    let password_bytes = password.as_bytes();

    let salt = match SaltString::from_b64(salt) {
        Ok(salt) => salt,
        Err(_) => return StringResult::err("Failed to decode salt".to_string()),
    };

    let argon2 = argon2::Argon2::default();
    match argon2.hash_password(password_bytes, &salt) {
        Ok(hash) => StringResult::ok(hash.to_string()),
        Err(_) => StringResult::err("Failed to hash password".to_string()),
    }
}

/// Verifies a password against a provided hash.
///
/// # Safety
///
/// This function is unsafe because it operates on raw pointers.
///
/// The caller is responsible for:
/// - Ensuring both `password` and `pasword_hash` are valid pointers to null-terminated
///  C strings.
/// - Properly freeing the `string` and `error_ptr` fields of the returned
///  `BoolResult` struct on the Dart side.
///
/// To free the strings in Dart, you should use `ffi`'s `calloc.free` function.
/// Make sure you only free the strings when they are no longer needed, as doing
/// so earlier will likely cause your program to crash.
#[no_mangle]
pub unsafe extern "C" fn verify_password(
    password: *const c_char,
    password_hash: *const c_char,
) -> BoolResult {
    let password = match CStr::from_ptr(password).to_str() {
        Ok(password) => password,
        Err(_) => return BoolResult::err("Failed to decode password".to_string()),
    };
    let password_hash = match CStr::from_ptr(password_hash).to_str() {
        Ok(password_hash) => password_hash,
        Err(_) => return BoolResult::err("Failed to decode password hash".to_string()),
    };

    let password_bytes = password.as_bytes();

    let password_hash = match PasswordHash::new(password_hash) {
        Ok(hash) => hash,
        Err(_) => return BoolResult::err("Failed to decode password hash".to_string()),
    };

    let argon2 = argon2::Argon2::default();
    match argon2.verify_password(password_bytes, &password_hash) {
        Ok(_) => BoolResult::ok(true),
        Err(_) => BoolResult::ok(false),
    }
}

/// Derives an encryption key from a password and salt using the Argon2
/// algorithm. The derived key is 32 bytes long and is encoded as a hex string.
/// The key derivation uses the Argon2id algorithm with default parameters, with
/// the provided password serving as the secret key and the salt as the
/// associated data.
///
/// # Safety
///
/// This function is unsafe because it operates on raw pointers. The caller is
/// responsible for:
/// - Ensuring both `key` and `salt` are valid pointers to null-terminated C
///  strings.
/// - Properly freeing the `string` and `error_ptr` fields of the returned
///
/// `StringResult` struct on the Dart side. To free the strings in Dart, you
/// should use `ffi`'s `calloc.free` function.
#[no_mangle]
pub unsafe extern "C" fn derive_encryption_key(
    key: *const c_char,
    salt: *const c_char,
) -> StringResult {
    let key = match CStr::from_ptr(key).to_str() {
        Ok(key) => key,
        Err(_) => return StringResult::err("Failed to decode key".to_string()),
    };

    let salt = match CStr::from_ptr(salt).to_str() {
        Ok(salt) => salt,
        Err(_) => return StringResult::err("Failed to decode salt".to_string()),
    };

    let key_bytes = key.as_bytes();
    let salt_bytes = salt.as_bytes();

    let mut derived_key = [0u8; 32];
    let argon2 = argon2::Argon2::default();
    match argon2.hash_password_into(key_bytes, salt_bytes, &mut derived_key) {
        Ok(_) => StringResult::ok(base64_encode(derived_key)),
        Err(_) => StringResult::err("Failed to derive encryption key".to_string()),
    }
}
#[cfg(test)]
mod tests {
    use super::*;
    use std::ffi::CString;

    #[test]
    fn test_password_hashing_and_verification() {
        // Convert password to `CString`
        let password = CString::new("password123").expect("Failed to create CString");

        // Generate salt
        let salt_ptr = generate_salt();

        // Hash password
        let hashed_password = unsafe { hash_password(password.as_ptr(), salt_ptr) };

        assert!(hashed_password.is_ok(), "Password hashing failed");

        let hashed_password = hashed_password.unwrap();

        // Create a CString for the hashed_password
        let hashed_password_cstring =
            CString::new(hashed_password).expect("Failed to create CString");

        // Verify password
        let verify_result =
            unsafe { verify_password(password.as_ptr(), hashed_password_cstring.as_ptr()) };

        assert!(verify_result.is_ok(), "Password verification failed");
        assert!(verify_result.unwrap(), "Password didn't match");
    }

    #[test]
    fn test_encryption_key_derivation() {
        // Convert key to `CString`
        let key = CString::new("key123").expect("Failed to create CString");

        // Generate salt
        let salt_ptr = generate_salt();

        // Derive encryption key
        let derived_key = unsafe { derive_encryption_key(key.as_ptr(), salt_ptr) };

        assert!(derived_key.is_ok(), "Encryption key derivation failed");
    }
}
