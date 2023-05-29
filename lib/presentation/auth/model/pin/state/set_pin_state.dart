import 'package:equatable/equatable.dart';
import 'package:mostro_app/presentation/auth/model/pin/form/pin_form.dart';

enum SetPinFormStatus { initial, submiting, success, error }

class SetPinState extends Equatable {
  final SetPinFormStatus status;
  final SetPinFormState form;

  bool get isSubmiting => status == SetPinFormStatus.submiting;
  bool get isSuccess => status == SetPinFormStatus.success;

  const SetPinState({
    this.status = SetPinFormStatus.initial,
    this.form = const SetPinFormState(),
  });

  SetPinState copyWith({
    SetPinFormState? form,
    SetPinFormStatus? status,
  }) {
    return SetPinState(
      form: form ?? this.form,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [form, status];
}
