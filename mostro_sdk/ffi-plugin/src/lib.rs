pub mod client;
pub mod common;
pub mod crypto;
pub mod keys;

mod prelude {
    pub use crate::common::option::{BoolOption, PtrOption, StringOption};
    pub use crate::common::result::{BoolResult, PtrResult, StringResult};
    pub use crate::common::utils::to_raw_ptr;
    pub use std::ffi::{c_char, c_void, CStr, CString};
    pub use std::str::FromStr;
}
