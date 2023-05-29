use crate::prelude::*;
use nostr_sdk::secp256k1::SecretKey;

/// Create a new secret key from a 32-byte array.
/// # Safety
#[no_mangle]
pub unsafe extern "C" fn secret_key_from_str(sk_str: *const c_char) -> PtrResult {
    let sk_str = CStr::from_ptr(sk_str);

    let sk_str = match sk_str.to_str() {
        Ok(s) => s,
        Err(e) => return PtrResult::err(e.to_string()),
    };

    match SecretKey::from_str(sk_str) {
        Ok(sk) => PtrResult::ok(to_raw_ptr(sk)),
        Err(e) => PtrResult::err(e.to_string()),
    }
}

/// Secret Key to String
/// # Safety
#[no_mangle]
pub unsafe extern "C" fn secret_key_to_str(sk: *mut c_void) -> *const c_char {
    let sk = sk as *mut SecretKey;
    let sk = Box::from_raw(sk);
    let sk = sk.display_secret().to_string();
    let sk = CString::new(sk).unwrap();
    sk.into_raw()
}

/// Check if a secret key is valid.
/// # Safety
#[no_mangle]
pub unsafe extern "C" fn validate_secret_key(secret_key: *const c_char) -> BoolResult {
    let secret_key = match CStr::from_ptr(secret_key).to_str() {
        Ok(secret_key) => secret_key,
        Err(_) => return BoolResult::err("Failed to decode secret key".to_string()),
    };

    match SecretKey::from_str(secret_key) {
        Ok(_) => BoolResult::ok(true),
        Err(e) => BoolResult::err(e.to_string()),
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn test_keys_is_valid_sk() {
        let valid_secret_key = "066f06c5267aae970bf0e5a0cdd8bdb008b434209711bbfebec924358da05e52";
        let invalid_secret_key = "invalid_key_string";

        unsafe {
            assert!(
                validate_secret_key(CString::new(valid_secret_key).unwrap().into_raw()).unwrap()
            );

            assert!(
                !validate_secret_key(CString::new(invalid_secret_key).unwrap().into_raw()).unwrap()
            );
        }
    }
}
