use crate::prelude::*;
use std::ptr;

#[repr(C)]
pub struct StringResult {
    pub ok_ptr: *const c_char,
    pub error_ptr: *const c_char,
}

impl StringResult {
    pub fn ok(string: String) -> Self {
        let ok_ptr = CString::new(string).unwrap().into_raw();
        Self {
            ok_ptr,
            error_ptr: ptr::null(),
        }
    }

    pub fn err(error: String) -> Self {
        let error_ptr = CString::new(error).unwrap().into_raw();
        Self {
            ok_ptr: ptr::null(),
            error_ptr,
        }
    }

    pub fn is_ok(&self) -> bool {
        !self.ok_ptr.is_null()
    }

    pub fn is_err(&self) -> bool {
        !self.error_ptr.is_null()
    }

    pub fn unwrap(self) -> String {
        unsafe { CStr::from_ptr(self.ok_ptr) }
            .to_str()
            .unwrap()
            .to_string()
    }
}

#[repr(C)]
pub struct BoolResult {
    pub boolean: bool,
    pub error_ptr: *const c_char,
}

impl BoolResult {
    pub fn ok(boolean: bool) -> Self {
        Self {
            boolean,
            error_ptr: std::ptr::null(),
        }
    }

    pub fn err(error: String) -> Self {
        let error_ptr = CString::new(error).unwrap().into_raw();
        Self {
            boolean: false,
            error_ptr,
        }
    }

    pub fn is_ok(&self) -> bool {
        self.boolean
    }

    pub fn is_err(&self) -> bool {
        !self.error_ptr.is_null()
    }

    pub fn unwrap(self) -> bool {
        self.boolean
    }
}
