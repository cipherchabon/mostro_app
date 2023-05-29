use crate::prelude::*;
use nostr_sdk::client::options;

/// Create new [`Options`] with wait for connection
/// # Safety
#[no_mangle]
pub unsafe extern "C" fn options_new_with_wait_for_connection(wait: bool) -> *mut c_void {
    let opts = options::Options::new().wait_for_connection(wait);
    Box::into_raw(Box::new(opts)) as *mut c_void
}
