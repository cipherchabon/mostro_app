use std::ffi::{c_char, CString};

/// Frees a pointer to a `c_char` string.
/// # Safety
#[no_mangle]
pub unsafe extern "C" fn free_char_ptr(ptr: *mut c_char) {
    if !ptr.is_null() {
        drop(CString::from_raw(ptr));
    }
}
