pub mod options;
use std::ptr::null_mut;

use nostr_sdk::client::options as op;
use nostr_sdk::{client, Keys};
use tokio::runtime::Runtime;

use crate::prelude::*;

/// Create a new [`Client`] with [`Options`]
/// # Safety
#[no_mangle]
pub unsafe extern "C" fn client_new_with_opts(
    keys_ptr: *mut c_void,
    opts_ptr: *mut c_void,
) -> *mut c_void {
    let keys = &*(keys_ptr as *mut Keys);
    let opts = &*(opts_ptr as *mut op::Options);
    let client = client::Client::with_opts(keys, opts.clone());
    to_raw_ptr(client)
}

/// Add new relays
/// # Safety
#[no_mangle]
pub unsafe extern "C" fn client_add_relay(
    url: *const c_char,
    client_ptr: *mut c_void,
    runtime_ptr: *mut c_void,
) -> PtrResult {
    let rt = &mut *(runtime_ptr as *mut Runtime);
    let client = &*(client_ptr as *mut client::Client);
    let url = match CStr::from_ptr(url).to_str() {
        Ok(url) => url,
        Err(err) => {
            let error_string = format!("Failed to convert C string to Rust string: {}", err);
            return PtrResult::err(error_string);
        }
    };

    // Execute the task and block until it completes
    match rt.block_on(client.add_relay(url, None)) {
        Ok(_) => PtrResult::ok(null_mut()),
        Err(err) => {
            let error_string = format!("{}", err);
            PtrResult::err(error_string)
        }
    }
}

/// Connect to all added relays
/// # Safety
#[no_mangle]
pub unsafe extern "C" fn client_connect(client_ptr: *mut c_void, runtime_ptr: *mut c_void) {
    let rt = &mut *(runtime_ptr as *mut Runtime);
    let client = &*(client_ptr as *mut client::Client);

    // Execute the task and block until it completes
    rt.block_on(client.connect());
}
