pub mod public_key;
pub mod secret_key;

use crate::prelude::*;
use nostr_sdk::{
    secp256k1::{SecretKey, XOnlyPublicKey},
    Keys,
};

/// Initialize from secret key.
/// # Safety
/// secret_key must be a valid 32-byte secret key
#[no_mangle]
pub unsafe extern "C" fn keys_new(secret_key: *mut c_void) -> *mut c_void {
    let secret_key = *(secret_key as *mut SecretKey);
    let keys = Keys::new(secret_key);
    to_raw_ptr(keys)
}

/// Initialize with public key only (no secret key).
/// # Safety
/// public_key must be a valid 33-byte public key
#[no_mangle]
pub unsafe extern "C" fn keys_from_public_key(public_key: *mut c_void) -> *mut c_void {
    let public_key = *(public_key as *mut XOnlyPublicKey);
    let keys = Keys::from_public_key(public_key);
    to_raw_ptr(keys)
}

/// Generate a new key pair
#[no_mangle]
pub extern "C" fn keys_generate() -> *mut c_void {
    let keys = Keys::generate();
    to_raw_ptr(keys)
}

/// Get the public key
/// # Safety
#[no_mangle]
pub unsafe extern "C" fn keys_get_public_key(keys_ptr: *mut c_void) -> *mut c_void {
    let keys = &*(keys_ptr as *mut Keys);
    let public_key = keys.public_key();
    to_raw_ptr(public_key)
}

/// Get the secret key
/// # Safety
#[no_mangle]
pub unsafe extern "C" fn keys_get_secret_key(keys_ptr: *mut c_void) -> PtrOption {
    let keys = &*(keys_ptr as *mut Keys);
    match keys.secret_key() {
        Ok(sk) => PtrOption::some(to_raw_ptr(sk)),
        Err(_) => PtrOption::none(),
    }
}
