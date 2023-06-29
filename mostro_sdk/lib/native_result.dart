import 'dart:ffi';

import 'package:mostro_sdk/common.dart';
import 'exceptions.dart';
import 'mostro_sdk_bindings_generated.dart';

extension StringResultExtension on StringResult {
  Result<String, NativeException> toDartResult() {
    if (error_ptr != nullptr && ok_ptr == nullptr) {
      final error = error_ptr.toDartString();
      return Failure(NativeException.unknown(error));
    } else if (error_ptr == nullptr && ok_ptr != nullptr) {
      final string = ok_ptr.toDartString();
      return Success(string);
    } else {
      throw NativeError.unexpected();
    }
  }
}

extension NativeBoolExtension on BoolResult {
  Result<bool, NativeException> toDartResult() {
    if (error_ptr != nullptr) {
      final error = error_ptr.toDartString();
      return Failure(NativeException.unknown(error));
    } else if (error_ptr == nullptr && boolean) {
      return Success(boolean);
    } else {
      throw NativeError.unexpected();
    }
  }
}
