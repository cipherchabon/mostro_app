import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_form.freezed.dart';

@freezed
class AuthFormState with _$AuthFormState {
  const factory AuthFormState({
    @Default(KeyTextField()) KeyTextField value,
  }) = _AuthStateForm;
}

extension AuthFormExtension on AuthFormState {
  bool get isKeyValid => value.error == null;

  bool get isValid => isKeyValid;
}

@freezed
class KeyTextField with _$KeyTextField {
  const factory KeyTextField({
    String? value,
    @Default(KeyTextFieldError.empty) KeyTextFieldError? error,
  }) = _KeyTextField;
}

enum KeyTextFieldError {
  empty('Key is required'),
  invalid('Invalid key');

  const KeyTextFieldError(this.message);

  final String message;
}

KeyTextFieldError? validateKey(String value) {
  if (value.isEmpty) {
    return KeyTextFieldError.empty;
  } else if (!value.startsWith('npub')) {
    return KeyTextFieldError.invalid;
  }
  return null;
}
