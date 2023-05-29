import 'package:mostro_sdk/native_option.dart';
import 'package:oxidized/oxidized.dart';

import '../common.dart';
import '../ffi_bindings.dart';
import 'public_key.dart';
import 'secret_key.dart';

class Keys extends NativeObject {
  // Pointer to the native struct

  const Keys._(super.ptr);

  /// Initialize from secret key
  factory Keys.fromSecretKey(SecretKey sk) {
    final ptr = bindings.keys_new(sk.ptr);
    return Keys._(ptr);
  }

  /// Initialize from secret key
  factory Keys.fromPublicKey(PublicKey pk) {
    final ptr = bindings.keys_from_public_key(pk.ptr);
    return Keys._(ptr);
  }

  /// Generate a new key pair
  factory Keys.generate() {
    final keyPtr = bindings.keys_generate();
    return Keys._(keyPtr);
  }

  /// Generate a new key pair
  PublicKey publicKey() {
    final ptr = bindings.keys_get_public_key(super.ptr);
    return PublicKey(ptr);
  }

  /// Get the secret key as a string
  Option<SecretKey> secretKey() {
    final option = bindings.keys_get_secret_key(super.ptr).toDartOption();
    return option.map((ptr) => SecretKey(ptr));
  }

  @override
  void dispose() {
    bindings.free_keys_ptr(ptr);
  }

  @override
  List<Object> get props => [publicKey(), secretKey()];
}
