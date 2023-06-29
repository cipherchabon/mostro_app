#include <stdbool.h>

typedef struct StringResult {
  const char *ok_ptr;
  const char *error_ptr;
} StringResult;

typedef struct BoolResult {
  bool boolean;
  const char *error_ptr;
} BoolResult;

/**
 * Frees a pointer to a `c_char` string.
 * # Safety
 */
void free_char_ptr(char *ptr);

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
 * - key shoud be a base64 encoded string
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
struct StringResult decrypt(const char *encrypted_data_json);

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
 * # Safety
 */
struct StringResult get_keys_from_sk_str(const char *value);

/**
 * # Safety
 */
struct StringResult get_keys_from_pk_str(const char *value);

/**
 * Check if a public key (XOnlyPublicKey) is valid.
 * # Safety
 */
struct BoolResult validate_public_key(const char *public_key);

/**
 * Check if a secret key is valid.
 * # Safety
 */
struct BoolResult validate_secret_key(const char *secret_key);
