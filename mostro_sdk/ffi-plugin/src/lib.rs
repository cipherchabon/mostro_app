pub mod common;
pub mod crypto;
pub mod keys;

mod prelude {
    pub use crate::common::option::{BoolOption, StringOption};
    pub use crate::common::result::{BoolResult, StringResult};
    pub use std::ffi::{c_char, c_void, CStr, CString};
    pub use std::str::FromStr;
}
