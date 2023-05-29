import 'package:ffi/ffi.dart';
import 'package:mostro_sdk/exceptions.dart';
import 'package:mostro_sdk/native_result.dart';
import 'package:oxidized/oxidized.dart';

import '../common.dart';
import '../ffi_bindings.dart';

class SecretKey extends NativeObject {
  /// Validates a secret key.
  static Result<bool, NativeException> validate(String value) {
    final nativeValue = value.toNative();
    final res = bindings.validate_secret_key(nativeValue);
    calloc.free(nativeValue);
    return res.toDartResult();
  }

  const SecretKey(super.ptr);

  factory SecretKey.fromString(String value) {
    final nativeValue = value.toNative();
    final ptrResult = bindings.secret_key_from_str(nativeValue);
    final result = ptrResult.toDartResult();
    calloc.free(nativeValue);
    return result.when(
      ok: (ptr) => SecretKey(ptr),
      err: (e) => throw e,
    );
  }

  @override
  String toString() {
    return bindings.secret_key_to_str(ptr).toDartString();
  }

  @override
  void dispose() {
    bindings.free_sk_ptr(ptr);
    super.dispose();
  }

  @override
  List<Object> get props => [toString()];
}
