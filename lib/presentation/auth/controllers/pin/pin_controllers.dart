import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/repositories/pin_repository.dart';
import '../../../../domain/models/pin.dart';
import '../../../../providers/providers.dart';
import '../../../widgets/widgets.dart' show FocusNode, TextEditingController;

part 'pin_controllers.g.dart';

@Riverpod(keepAlive: true)
Future<Pin?> pin(PinRef ref) {
  final repo = ref.read(authRepositoryProvider);
  return repo.getPin();
}

@riverpod
FocusNode pinFocusNode(PinFocusNodeRef ref) {
  final focusNode = FocusNode();
  ref.onDispose(() {
    focusNode.dispose();
  });
  return focusNode;
}

@riverpod
TextEditingController pinFieldController(PinFieldControllerRef ref) {
  final controller = TextEditingController();
  ref.onDispose(() {
    controller.dispose();
  });
  return controller;
}

@riverpod
TextEditingController confirmPinFieldController(
    ConfirmPinFieldControllerRef ref) {
  final controller = TextEditingController();
  ref.onDispose(() {
    controller.dispose();
  });
  return controller;
}

@riverpod
Stream<String> pinValue(PinValueRef ref) {
  final streamController = StreamController<String>();
  final field = ref.watch(pinFieldControllerProvider);

  ref.onDispose(() {
    streamController.close();
  });

  field.addListener(() {
    streamController.add(field.text);
  });

  return streamController.stream;
}

@riverpod
Stream<String> confirmPinValue(ConfirmPinValueRef ref) {
  final streamController = StreamController<String>();
  final field = ref.watch(confirmPinFieldControllerProvider);

  ref.onDispose(() {
    streamController.close();
  });

  field.addListener(() {
    streamController.add(field.text);
  });

  return streamController.stream;
}

@riverpod
class PinScreenController extends _$PinScreenController {
  PinRepository get repo => ref.read(authRepositoryProvider);
  Pin? get pin => ref.watch(pinProvider).value;
  FocusNode get focus => ref.watch(pinFocusNodeProvider);
  String get pinValue => ref.watch(pinValueProvider).value ?? '';

  @override
  PinScreenState build() {
    // Observe the pin value
    ref.listen(pinValueProvider, (_, next) {
      next.whenData((value) {
        if (value.length == 6) {
          if (pin != null) {
            if (repo.checkPin(value, pin!)) {
              Future.delayed(const Duration(milliseconds: 100), () {
                state = Success();
              });
            } else {
              state = PinError(PinFieldError.invalid);
              Future.delayed(const Duration(milliseconds: 600), () {
                ref.read(pinFieldControllerProvider).clear();
                state = EnterPin();
                focus.requestFocus();
              });
            }
          } else {
            state = ConfirmPin();
            Future.delayed(const Duration(milliseconds: 100), () {
              focus.requestFocus();
            });
          }
        }
      });
    });

    // Observe the confirm pin value
    ref.listen(confirmPinValueProvider, (prev, next) {
      next.whenData((value) {
        if (value.length == 6) {
          if (pinValue != value) {
            state = PinError(PinFieldError.doesNotMatch);
            Future.delayed(const Duration(milliseconds: 600), () {
              ref.read(confirmPinFieldControllerProvider).clear();
              state = ConfirmPin();
              focus.requestFocus();
            });
          } else {
            state = Submitting();

            repo.setPin(value).then((value) {
              state = Success();
            });
          }
        }
      });
    });

    return pin == null ? SetPin() : EnterPin();
  }
}

sealed class PinScreenState extends Equatable {
  bool get isEnterPin => this is EnterPin;
  bool get isSetPin => this is SetPin;
  bool get isConfirmPin => this is ConfirmPin;
  bool get isError => this is PinError;
  bool get isSubmitting => this is Submitting;
  bool get isSuccess => this is Success;

  const PinScreenState();

  @override
  List<Object?> get props => [];
}

class EnterPin extends PinScreenState {
  const EnterPin();
}

class SetPin extends PinScreenState {
  const SetPin();
}

class ConfirmPin extends PinScreenState {
  const ConfirmPin();
}

enum PinFieldError {
  invalid,
  doesNotMatch,
}

class PinError extends PinScreenState {
  final PinFieldError error;

  const PinError(this.error);

  @override
  List<Object?> get props => [error];
}

class Submitting extends PinScreenState {
  const Submitting();
}

class Success extends PinScreenState {
  const Success();
}
