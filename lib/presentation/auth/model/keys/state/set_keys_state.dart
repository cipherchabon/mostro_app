import 'package:freezed_annotation/freezed_annotation.dart';

import '../form/set_keys_form.dart';

part 'set_keys_state.freezed.dart';

@freezed
class SetKeysState with _$SetKeysState {
  factory SetKeysState.initial({
    @Default(SetKeysFormState()) SetKeysFormState form,
  }) = _Initial;

  factory SetKeysState.submitting({
    @Default(SetKeysFormState()) SetKeysFormState form,
  }) = _Submitting;

  factory SetKeysState.success({
    @Default(SetKeysFormState()) SetKeysFormState form,
  }) = _Success;

  factory SetKeysState.failure({
    @Default(SetKeysFormState()) SetKeysFormState form,
    required String e,
  }) = _Failure;
}

extension SetKeysStateExtension on SetKeysState {
  bool get isSubmitting => this is _Submitting;
  bool get isSuccess => this is _Success;
}
