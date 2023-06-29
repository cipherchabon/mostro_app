pub mod public_key;
pub mod secret_key;

pub use crate::prelude::*;
use nostr_sdk::{
    prelude::{FromPkStr, FromSkStr, ToBech32},
    Keys,
};
use serde_json::{json, Value};

// Constants
const FAILED_TO_DECODE_VALUE: &str = "Failed to decode value";
const FAILED_TO_ENCODE_JSON: &str = "Failed to encode JSON";

/// # Safety
#[no_mangle]
pub unsafe extern "C" fn get_keys_from_sk_str(value: *const c_char) -> StringResult {
    // Convert the input pointer to a Rust string
    let value = unsafe {
        if value.is_null() {
            return StringResult::err(FAILED_TO_DECODE_VALUE.to_string());
        }
        match CStr::from_ptr(value).to_str() {
            Ok(secret_key) => secret_key,
            Err(_) => return StringResult::err(FAILED_TO_DECODE_VALUE.to_string()),
        }
    };

    // Try to interpret the input as a private key
    let keys = match Keys::from_sk_str(value) {
        Ok(keys) => keys,
        Err(_) => return StringResult::err(FAILED_TO_DECODE_VALUE.to_string()),
    };

    // Generate the JSON string
    create_json_string(keys)
}

/// # Safety
#[no_mangle]
pub unsafe extern "C" fn get_keys_from_pk_str(value: *const c_char) -> StringResult {
    // Convert the input pointer to a Rust string
    let value = unsafe {
        if value.is_null() {
            return StringResult::err(FAILED_TO_DECODE_VALUE.to_string());
        }
        match CStr::from_ptr(value).to_str() {
            Ok(public_key) => public_key,
            Err(_) => return StringResult::err(FAILED_TO_DECODE_VALUE.to_string()),
        }
    };

    // Try to interpret the input as a public key
    let keys = match Keys::from_pk_str(value) {
        Ok(keys) => keys,
        Err(_) => return StringResult::err(FAILED_TO_DECODE_VALUE.to_string()),
    };

    // Generate the JSON string
    create_json_string(keys)
}

fn create_json_string(keys: Keys) -> StringResult {
    // Retrieve the public and private keys
    let public_key = keys.public_key();
    let secret_key = keys.secret_key();

    // Convert the public key to hex and bech32
    let public_key_hex = public_key.to_string();
    let public_key_bech32 = public_key.to_bech32().unwrap();

    // Convert the private key to hex and bech32 if it exists, else use null
    let secret_key_fields = secret_key.ok().map(|sk| {
        let secret_key_hex = sk.display_secret().to_string();
        let secret_key_bech32 = sk.to_bech32().unwrap();

        json!({
            "hex": secret_key_hex,
            "bech32": secret_key_bech32
        })
    });

    // Construct the JSON object
    let json = json!({
    "public_key": {
        "hex": public_key_hex,
        "bech32": public_key_bech32,
    },
    "secret_key": secret_key_fields.unwrap_or(Value::Null)
    });

    // Convert the JSON object to a string
    match serde_json::to_string(&json) {
        Ok(json) => StringResult::ok(json),
        Err(_) => StringResult::err(FAILED_TO_ENCODE_JSON.to_string()),
    }
}
