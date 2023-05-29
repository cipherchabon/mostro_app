use crate::prelude::*;
use nostr_sdk::secp256k1::XOnlyPublicKey;

/// Create a new public key from a 33-byte array.
/// # Safety
#[no_mangle]
pub unsafe extern "C" fn public_key_from_str(pk_str: *const c_char) -> PtrResult {
    let pk_str = CStr::from_ptr(pk_str);

    let pk_str = match pk_str.to_str() {
        Ok(s) => s,
        Err(e) => return PtrResult::err(e.to_string()),
    };

    match XOnlyPublicKey::from_str(pk_str) {
        Ok(pk) => PtrResult::ok(to_raw_ptr(pk)),
        Err(e) => PtrResult::err(e.to_string()),
    }
}

/// Public Key to String
/// # Safety
#[no_mangle]
pub unsafe extern "C" fn public_key_to_str(pk: *mut c_void) -> *const c_char {
    let pk = pk as *mut XOnlyPublicKey;
    let pk = Box::from_raw(pk);
    let pk = pk.to_string();
    let pk = CString::new(pk).unwrap();
    pk.into_raw()
}

/// Check if a public key (XOnlyPublicKey) is valid.
/// # Safety
#[no_mangle]
pub unsafe extern "C" fn validate_public_key(public_key: *const c_char) -> BoolResult {
    let public_key = match CStr::from_ptr(public_key).to_str() {
        Ok(public_key) => public_key,
        Err(_) => return BoolResult::err("Failed to decode public key".to_string()),
    };

    match XOnlyPublicKey::from_str(public_key) {
        Ok(_) => BoolResult::ok(true),
        Err(e) => BoolResult::err(e.to_string()),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_keys_is_valid_pk() {
        let valid_public_key = "9e0720eb46e6dcf1e19a47857561ceb9479c32c174edf0ab51893ec728ff62f5";
        let invalid_public_key = "invalid_key_string";

        unsafe {
            assert!(
                validate_public_key(CString::new(valid_public_key).unwrap().into_raw()).unwrap()
            );
            assert!(
                !validate_public_key(CString::new(invalid_public_key).unwrap().into_raw()).unwrap()
            );
        }
    }
}
