use crate::prelude::*;
use nostr_sdk::{
    secp256k1::{SecretKey, XOnlyPublicKey},
    Keys,
};

/// Frees a pointer to a `Keys` struct.
/// # Safety
#[no_mangle]
pub unsafe extern "C" fn free_keys_ptr(ptr: *mut c_void) {
    free_any_ptr::<Keys>(ptr);
}

/// Frees a pointer to a `XOnlyPublicKey` struct.
/// # Safety
#[no_mangle]
pub unsafe extern "C" fn free_pk_ptr(ptr: *mut c_void) {
    free_any_ptr::<XOnlyPublicKey>(ptr);
}

/// Frees a pointer to a `SecretKey` struct.
/// # Safety
#[no_mangle]
pub unsafe extern "C" fn free_sk_ptr(ptr: *mut c_void) {
    free_any_ptr::<SecretKey>(ptr);
}

unsafe fn free_any_ptr<T>(ptr: *mut c_void) {
    if !ptr.is_null() {
        drop(Box::from_raw(ptr as *mut T));
    }
}

/// Frees a pointer to a `c_char` string.
/// # Safety
#[no_mangle]
pub unsafe extern "C" fn free_char_ptr(ptr: *mut c_char) {
    if !ptr.is_null() {
        drop(CString::from_raw(ptr));
    }
}
