use std::ptr;

use crate::prelude::*;

use tokio::runtime::Runtime;

/// Create a new Tokio runtime.
/// # Safety
#[no_mangle]
pub unsafe extern "C" fn create_runtime() -> *mut c_void {
    match Runtime::new() {
        Ok(rt) => Box::into_raw(Box::new(rt)) as *mut _,
        Err(_) => ptr::null_mut(),
    }
}

/// Destroy a Tokio runtime.
/// # Safety
#[no_mangle]
pub unsafe extern "C" fn destroy_runtime(runtime_ptr: *mut c_void) {
    if !runtime_ptr.is_null() {
        drop(Box::from_raw(runtime_ptr as *mut Runtime))
    }
}
