use crate::prelude::*;
use nostr_sdk::{prelude::FromSkStr, Keys};

/// Check if a secret key is valid.
/// # Safety
#[no_mangle]
pub unsafe extern "C" fn validate_secret_key(secret_key: *const c_char) -> BoolResult {
    let secret_key = match CStr::from_ptr(secret_key).to_str() {
        Ok(secret_key) => secret_key,
        Err(_) => return BoolResult::err("Failed to decode secret key".to_string()),
    };

    match Keys::from_sk_str(secret_key) {
        Ok(_) => BoolResult::ok(true),
        Err(e) => BoolResult::err(e.to_string()),
    }
}
