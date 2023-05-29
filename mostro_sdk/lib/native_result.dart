import 'dart:ffi';

import 'package:mostro_sdk/common.dart';
import 'package:oxidized/oxidized.dart';

import 'exceptions.dart';
import 'mostro_sdk_bindings_generated.dart';

extension NativeResultExtension on PtrResult {
  Result<Pointer<Void>, NativeException> toDartResult() {
    if (error_ptr != nullptr && ptr == nullptr) {
      final error = error_ptr.toDartString();
      return Result.err(NativeException.unknown(error));
    } else if (error_ptr == nullptr && ptr != nullptr) {
      return Result.ok(ptr);
    } else {
      throw NativeError.unexpected();
    }
  }
}

extension StringResultExtension on StringResult {
  Result<String, NativeException> toDartResult() {
    if (error_ptr != nullptr && ok_ptr == nullptr) {
      final error = error_ptr.toDartString();
      return Result.err(NativeException.unknown(error));
    } else if (error_ptr == nullptr && ok_ptr != nullptr) {
      final string = ok_ptr.toDartString();
      return Result.ok(string);
    } else {
      throw NativeError.unexpected();
    }
  }
}

extension NativeBoolExtension on BoolResult {
  Result<bool, NativeException> toDartResult() {
    if (error_ptr != nullptr) {
      final error = error_ptr.toDartString();
      return Result.err(NativeException.unknown(error));
    } else if (error_ptr == nullptr && boolean) {
      return Result.ok(boolean);
    } else {
      throw NativeError.unexpected();
    }
  }
}
