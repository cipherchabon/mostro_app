import 'package:mostro_app/screens/auth/model/form/auth_form.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/auth_state.dart';

part 'auth_controller.g.dart';

// TODO: snackbar with error message
// TODO: navigate to home screen on success
// TODO: disable generate new key button when submitting

@riverpod
class AuthController extends _$AuthController {
  @override
  AuthState build() {
    return AuthState.initial();
  }

  void onKeyInputChanged(String value) {
    final res = validateKey(value);
    state = state.copyWith(
      form: state.form.copyWith(
        value: state.form.value.copyWith(
          value: value,
          error: res,
        ),
      ),
    );
  }

  void onAuthButtonPressed() async {
    state = AuthState.submitting();
    // TODO: auth
    await Future.delayed(const Duration(seconds: 1));
    state = AuthState.success();
  }
}
