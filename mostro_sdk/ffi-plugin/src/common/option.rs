use crate::prelude::*;

#[repr(C)]
pub struct PtrOption {
    pub ptr: *mut c_void,
}

impl PtrOption {
    pub fn some(ptr: *mut c_void) -> Self {
        Self { ptr }
    }

    pub fn none() -> Self {
        Self {
            ptr: std::ptr::null_mut(),
        }
    }
}

#[repr(C)]
pub struct StringOption {
    pub string: *const c_char,
}

impl StringOption {
    pub fn some(string: String) -> Self {
        let string = CString::new(string).unwrap().into_raw();
        Self { string }
    }

    pub fn none() -> Self {
        Self {
            string: std::ptr::null(),
        }
    }
}

#[repr(C)]
pub struct BoolOption {
    pub boolean: bool,
}

impl BoolOption {
    pub fn some(boolean: bool) -> Self {
        Self { boolean }
    }

    pub fn none() -> Self {
        Self { boolean: false }
    }
}
