import 'dart:ffi';

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

/// Base Result class
/// [S] represents the type of the success value
/// [E] should be [Exception] or a subclass of it
sealed class Result<S, E extends Exception> {
  S unwrap() => (this as Success<S, E>).value;
  E unwrapErr() => (this as Failure<S, E>).exception;

  const Result();

  T when<T>({
    required T Function(S value) success,
    required T Function(E exception) failure,
  }) {
    return switch (this) {
      (Success<S, E> ok) => success(ok.value),
      (Failure<S, E> err) => failure(err.exception),
    };
  }

  bool isOk() {
    return this is Success<S, E>;
  }
}

final class Success<S, E extends Exception> extends Result<S, E> {
  const Success(this.value);
  final S value;
}

final class Failure<S, E extends Exception> extends Result<S, E> {
  const Failure(this.exception);
  final E exception;
}
