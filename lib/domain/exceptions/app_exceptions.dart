sealed class AppException implements Exception {
  final String message;

  const AppException(this.message);

  const factory AppException.unexpected(String message) =
      AppUnexpectedException;

  const factory AppException.native(String message) = AppNativeException;

  @override
  String toString() => 'AppException: $message';
}

class AppUnexpectedException extends AppException {
  const AppUnexpectedException(String message) : super(message);

  @override
  String toString() => 'AppUnexpectedException: $message';
}

class AppNativeException extends AppException {
  const AppNativeException(String message) : super(message);

  @override
  String toString() => 'AppNativeException: $message';
}

/// LOCAL STORAGE EXCEPTIONS

sealed class LocalStorageException extends AppException {
  const LocalStorageException(super.message);

  /// When data doesn't have an expected format and cannot be parsed.
  const factory LocalStorageException.format(String message) =
      LocalStorageFormatException;

  // When data has an unexpected type.
  factory LocalStorageException.unexpectedType(String message) =
      LocalStorageUnexpectedTypeException;
}

class LocalStorageFormatException extends LocalStorageException {
  const LocalStorageFormatException(super.message);

  @override
  String toString() => 'LocalStorageFormatException: $message';
}

class LocalStorageUnexpectedTypeException extends LocalStorageException {
  LocalStorageUnexpectedTypeException(super.message);

  @override
  String toString() => 'LocalStorageUnexpectedTypeException: $message';
}
