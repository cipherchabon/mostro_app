import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:ffi/ffi.dart';

import 'ffi_bindings.dart';

extension StringExtension on String {
  /// Make sure to call [calloc.free] on the returned pointer when you're done
  Pointer<Char> toNative() => toNativeUtf8().cast<Char>();
}

extension PointerCharExtension on Pointer<Char> {
  /// This method frees the pointer, so make sure to call it only once.
  String toDartString() {
    final string = cast<Utf8>().toDartString();
    bindings.free_char_ptr(this);
    return string;
  }
}

abstract class NativeObject extends Equatable {
  final Pointer<Void> ptr;

  const NativeObject(this.ptr);

  void dispose() {}

  @override
  List<Object> get props => [ptr];
}
