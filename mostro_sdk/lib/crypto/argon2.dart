import 'package:ffi/ffi.dart';
import 'package:mostro_sdk/common.dart';
import 'package:mostro_sdk/ffi_bindings.dart';
import 'package:mostro_sdk/native_result.dart';

import '../exceptions.dart';

class Argon2 {
  Argon2._();

  /// Generates a random salt using the Argon2 algorithm.
  static String generateSalt() {
    final ptr = bindings.generate_salt();
    return ptr.toDartString();
  }

  /// Hashes a password with a provided salt using the Argon2 algorithm.
  static Result<String, NativeException> hashPassword(
    String password,
    String salt,
  ) {
    final nativePassword = password.toNative();
    final nativeSalt = salt.toNative();
    final result = bindings.hash_password(nativePassword, nativeSalt);
    calloc.free(nativePassword);
    calloc.free(nativeSalt);
    return result.toDartResult();
  }

  /// Verifies a password against a provided hash.
  static Result<bool, NativeException> verifyPassword(
    String password,
    String hash,
  ) {
    final nativePassword = password.toNative();
    final nativeHash = hash.toNative();
    final result = bindings.verify_password(nativePassword, nativeHash);
    calloc.free(nativePassword);
    calloc.free(nativeHash);
    return result.toDartResult();
  }

  /// Derives an encryption key from a password and salt using the Argon2
  /// algorithm. The derived key is 32 bytes long and is encoded as a hex
  /// string. The key derivation uses the Argon2id algorithm with default
  /// parameters, with the provided password serving as the secret key and the
  /// salt as the associated data.
  static Result<String, NativeException> deriveEncryptionKey(
    String key,
    String salt,
  ) {
    final nativeKey = key.toNative();
    final nativeSalt = salt.toNative();
    final result = bindings.derive_encryption_key(nativeKey, nativeSalt);
    calloc.free(nativeKey);
    calloc.free(nativeSalt);
    return result.toDartResult();
  }
}
