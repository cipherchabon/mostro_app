import 'dart:ffi';

import 'package:oxidized/oxidized.dart';

import 'mostro_sdk_bindings_generated.dart';

extension NativeOptionExtension on PtrOption {
  Option<Pointer<Void>> toDartOption() {
    return ptr != nullptr ? Option.some(ptr) : const Option.none();
  }
}
