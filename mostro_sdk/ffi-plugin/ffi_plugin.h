#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

typedef struct PtrResult {
  void *ptr;
  const char *error_ptr;
} PtrResult;

typedef struct StringResult {
  const char *ok_ptr;
  const char *error_ptr;
} StringResult;

typedef struct BoolResult {
  bool boolean;
  const char *error_ptr;
} BoolResult;

typedef struct PtrOption {
  void *ptr;
} PtrOption;

/**
 * Create a new [`Client`] with [`Options`]
 * # Safety
 */
void *client_new_with_opts(void *keys_ptr, void *opts_ptr);

/**
 * Add new relays
 * # Safety
 */
struct PtrResult client_add_relay(const char *url, void *client_ptr, void *runtime_ptr);

/**
 * Connect to all added relays
 * # Safety
 */
void client_connect(void *client_ptr, void *runtime_ptr);

/**
 * Create new [`Options`] with wait for connection
 * # Safety
 */
void *options_new_with_wait_for_connection(bool wait);

/**
 * Frees a pointer to a `Keys` struct.
 * # Safety
 */
void free_keys_ptr(void *ptr);

/**
 * Frees a pointer to a `XOnlyPublicKey` struct.
 * # Safety
 */
void free_pk_ptr(void *ptr);

/**
 * Frees a pointer to a `SecretKey` struct.
 * # Safety
 */
void free_sk_ptr(void *ptr);

/**
 * Frees a pointer to a `c_char` string.
 * # Safety
 */
void free_char_ptr(char *ptr);

/**
 * Create a new Tokio runtime.
 * # Safety
 */
void *create_runtime(void);

/**
 * Destroy a Tokio runtime.
 * # Safety
 */
void destroy_runtime(void *runtime_ptr);

/**
 * Encrypts data using the AES-GCM-SIV algorithm.
 *
 * # Safety
 *
 * This function is unsafe because it operates on raw pointers.
 *
 * The caller is responsible for:
 * - Ensuring both `key` and `data` are valid pointers to null-terminated
 *  C strings.
 * - Properly freeing the `string` and `error_ptr` fields of the returned
 * `StringResult` struct on the Dart side.
 *
 * To free the strings in Dart, you should use `ffi`'s `calloc.free` function.
 */
struct StringResult encrypt(const char *key, const char *data);

/**
 * Decrypts data using the AES-GCM-SIV algorithm.
 *
 * # Safety
 *
 * This function is unsafe because it operates on raw pointers.
 *
 * The caller is responsible for:
 * - Ensuring both `key` and `data` are valid pointers to null-terminated
 * C strings.
 * - Properly freeing the `string` and `error_ptr` fields of the returned
 * `StringResult` struct on the Dart side.
 *
 * To free the strings in Dart, you should use `ffi`'s `calloc.free` function.
 */
struct StringResult decrypt(const char *key, const char *encrypted_data_json);

/**
 * Generates a random salt using the Argon2 algorithm.
 */
const char *generate_salt(void);

/**
 * Hashes a password with a provided salt using the Argon2 algorithm.
 *
 * # Safety
 *
 * This function is unsafe because it operates on raw pointers.
 *
 * The caller is responsible for:
 * - Ensuring both `password` and `salt` are valid pointers to null-terminated
 *   C strings.
 * - Properly freeing the `string` and `error_ptr` fields of the returned
 *   `StringResult` struct on the Dart side.
 *
 * To free the strings in Dart, you should use `ffi`'s `calloc.free` function.
 * Make sure you only free the strings when they are no longer needed, as doing
 * so earlier will likely cause your program to crash.
 */
struct StringResult hash_password(const char *password, const char *salt);

/**
 * Verifies a password against a provided hash.
 *
 * # Safety
 *
 * This function is unsafe because it operates on raw pointers.
 *
 * The caller is responsible for:
 * - Ensuring both `password` and `pasword_hash` are valid pointers to null-terminated
 *  C strings.
 * - Properly freeing the `string` and `error_ptr` fields of the returned
 *  `BoolResult` struct on the Dart side.
 *
 * To free the strings in Dart, you should use `ffi`'s `calloc.free` function.
 * Make sure you only free the strings when they are no longer needed, as doing
 * so earlier will likely cause your program to crash.
 */
struct BoolResult verify_password(const char *password, const char *password_hash);

/**
 * Derives an encryption key from a password and salt using the Argon2
 * algorithm. The derived key is 32 bytes long and is encoded as a hex string.
 * The key derivation uses the Argon2id algorithm with default parameters, with
 * the provided password serving as the secret key and the salt as the
 * associated data.
 *
 * # Safety
 *
 * This function is unsafe because it operates on raw pointers. The caller is
 * responsible for:
 * - Ensuring both `key` and `salt` are valid pointers to null-terminated C
 *  strings.
 * - Properly freeing the `string` and `error_ptr` fields of the returned
 *
 * `StringResult` struct on the Dart side. To free the strings in Dart, you
 * should use `ffi`'s `calloc.free` function.
 */
struct StringResult derive_encryption_key(const char *key, const char *salt);

/**
 * Initialize from secret key.
 * # Safety
 * secret_key must be a valid 32-byte secret key
 */
void *keys_new(void *secret_key);

/**
 * Initialize with public key only (no secret key).
 * # Safety
 * public_key must be a valid 33-byte public key
 */
void *keys_from_public_key(void *public_key);

/**
 * Generate a new key pair
 */
void *keys_generate(void);

/**
 * Get the public key
 * # Safety
 */
void *keys_get_public_key(void *keys_ptr);

/**
 * Get the secret key
 * # Safety
 */
struct PtrOption keys_get_secret_key(void *keys_ptr);

/**
 * Create a new public key from a 33-byte array.
 * # Safety
 */
struct PtrResult public_key_from_str(const char *pk_str);

/**
 * Public Key to String
 * # Safety
 */
const char *public_key_to_str(void *pk);

/**
 * Check if a public key (XOnlyPublicKey) is valid.
 * # Safety
 */
struct BoolResult validate_public_key(const char *public_key);

/**
 * Create a new secret key from a 32-byte array.
 * # Safety
 */
struct PtrResult secret_key_from_str(const char *sk_str);

/**
 * Secret Key to String
 * # Safety
 */
const char *secret_key_to_str(void *sk);

/**
 * Check if a secret key is valid.
 * # Safety
 */
struct BoolResult validate_secret_key(const char *secret_key);
