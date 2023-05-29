import 'dart:developer';

import 'package:mostro_app/application/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../providers/providers.dart';
import '../../model/pin/state/set_pin_state.dart';

part 'set_pin_controller.g.dart';

@riverpod
class SetPinController extends _$SetPinController {
  AuthService get authService => ref.read(authServiceProvider);

  @override
  SetPinState build() => SetPinState();

  void pinChanged(String value) {
    state = state.copyWith(
      form: state.form.copyWith(pin: value),
    );
  }

  void confirmPinChanged(String value) {
    final form = state.form.copyWith(confirmPin: value);

    if (form.isValid) {
      submit(value);
    } else {
      state = state.copyWith(form: form);
    }
  }

  void submit(String pin) async {
    state = state.copyWith(status: SetPinFormStatus.submiting);
    try {
      await authService.setPin(pin);
      state = state.copyWith(status: SetPinFormStatus.success);
    } catch (e) {
      log(e.toString());
      state = state.copyWith(status: SetPinFormStatus.error);
    }
  }
}
