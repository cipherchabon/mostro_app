import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mostro_app/screens/auth/model/form/auth_form.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState.initial({
    @Default(AuthFormState()) AuthFormState form,
  }) = _Initial;

  factory AuthState.submitting({
    @Default(AuthFormState()) AuthFormState form,
  }) = _Submitting;

  factory AuthState.success({
    @Default(AuthFormState()) AuthFormState form,
  }) = _Success;

  factory AuthState.failure({
    @Default(AuthFormState()) AuthFormState form,
    required String e,
  }) = _Failure;
}

extension AuthStateExtension on AuthState {
  bool get isSubmitting => this is _Submitting;
}
