import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/keys/form/set_keys_form.dart';
import '../../model/keys/state/set_keys_state.dart';

part 'set_keys_controller.g.dart';

// TODO: snackbar with error message
// TODO: navigate to home screen on success
// TODO: disable generate new key button when submitting

@riverpod
class SetKeysController extends _$SetKeysController {
  @override
  SetKeysState build() => SetKeysState.initial();

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
    state = SetKeysState.submitting();
    // TODO: auth
    await Future.delayed(const Duration(seconds: 1));
    state = SetKeysState.success();
  }
}
