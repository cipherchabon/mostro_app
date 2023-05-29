use crate::prelude::*;

use base64::{engine::general_purpose, DecodeError, Engine};

pub fn to_raw_ptr<T>(value: T) -> *mut c_void {
    Box::into_raw(Box::new(value)) as *mut c_void
}

pub fn base64_encode<T: AsRef<[u8]>>(input: T) -> String {
    general_purpose::STANDARD_NO_PAD.encode(input)
}

pub fn base64_decode<T: AsRef<[u8]>>(input: T) -> Result<Vec<u8>, DecodeError> {
    general_purpose::STANDARD_NO_PAD.decode(input.as_ref())
}
