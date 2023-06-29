use crate::prelude::*;
use nostr_sdk::{prelude::FromPkStr, Keys};

/// Check if a public key (XOnlyPublicKey) is valid.
/// # Safety
#[no_mangle]
pub unsafe extern "C" fn validate_public_key(public_key: *const c_char) -> BoolResult {
    let public_key = match CStr::from_ptr(public_key).to_str() {
        Ok(public_key) => public_key,
        Err(_) => return BoolResult::err("Failed to decode public key".to_string()),
    };

    match Keys::from_pk_str(public_key) {
        Ok(_) => BoolResult::ok(true),
        Err(e) => BoolResult::err(e.to_string()),
    }
}
