sealed class NativeException implements Exception {
  final String message;

  const NativeException(this.message);

  const factory NativeException.unknown(String message) = _UnknownException;

  @override
  String toString() => message;
}

class _UnknownException extends NativeException {
  const _UnknownException(super.message);
}

sealed class NativeError extends Error {
  final String message;

  NativeError(this.message);

  factory NativeError.unexpected() = _UnexpectedError;
}

class _UnexpectedError extends NativeError {
  _UnexpectedError() : super('Unexpected error');
}
