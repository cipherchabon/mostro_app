import 'package:equatable/equatable.dart';

const pinLength = 6;

class SetPinFormState extends Equatable {
  final String pin;
  final String confirmPin;

  bool get pinIsValid => pin.length == pinLength;
  bool get confirmPinIsValid =>
      confirmPin.length == pinLength && pin == confirmPin;
  bool get isValid => pinIsValid && confirmPinIsValid;

  String? get errorMessage {
    if (pinIsValid && confirmPin.length == pinLength && pin != confirmPin) {
      return 'Pin does not match';
    }
    return null;
  }

  const SetPinFormState({
    this.pin = '',
    this.confirmPin = '',
  });

  SetPinFormState copyWith({
    String? pin,
    String? confirmPin,
  }) {
    return SetPinFormState(
      pin: pin ?? this.pin,
      confirmPin: confirmPin ?? this.confirmPin,
    );
  }

  @override
  List<Object?> get props => [pin, confirmPin];
}

class EnterPinFormState extends Equatable {
  final String pin;

  bool get isValid => pin.length == pinLength;

  const EnterPinFormState({
    this.pin = '',
  });

  EnterPinFormState copyWith({
    String? pin,
  }) {
    return EnterPinFormState(
      pin: pin ?? this.pin,
    );
  }

  @override
  List<Object?> get props => [pin];
}
