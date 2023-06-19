import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/repositories/pin_repository.dart';
import '../../../../domain/models/pin.dart';
import '../../../../providers/providers.dart';
import '../../../widgets/widgets.dart' show FocusNode, TextEditingController;

part 'pin_controllers.g.dart';

@Riverpod(keepAlive: true)
class PinController extends _$PinController {
  PinRepository get authRepo => ref.read(authRepositoryProvider);

  @override
  Future<Pin?> build() async {
    final pin = await authRepo.getPin();
    return pin;
  }
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
  final field = ref.read(pinFieldControllerProvider);

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
  final field = ref.read(confirmPinFieldControllerProvider);

  ref.onDispose(() {
    streamController.close();
  });

  field.addListener(() {
    streamController.add(field.text);
  });

  return streamController.stream;
}

@riverpod
class SetPinScreenController extends _$SetPinScreenController {
  @override
  SetPinState build() {
    final focus = ref.watch(pinFocusNodeProvider);
    // Observe the pin value
    ref.listen(pinValueProvider, (_, next) {
      next.whenData((value) {
        print(value);
        if (value.length == 6) {
          state = ConfirmPin();
          Future.delayed(const Duration(milliseconds: 100), () {
            focus.requestFocus();
          });
        }
      });
    });

    // Observe the confirm pin value
    ref.listen(confirmPinValueProvider, (prev, next) {
      next.whenData((value) {
        print(value);
        if (value.length == 6) {
          final pinValue = ref.watch(pinValueProvider).value;
          if (pinValue != value) {
            state = PinError(PinFieldError.doesNotMatch);
            Future.delayed(const Duration(milliseconds: 600), () {
              ref.read(confirmPinFieldControllerProvider).clear();
              state = ConfirmPin();
              focus.requestFocus();
            });
            return;
          } else {
            state = Submitting();
            final repo = ref.read(authRepositoryProvider);
            repo.setPin(value).then((value) {
              state = Success();
            });
          }
        }
      });
    });

    return EnterPin();
  }
}

sealed class SetPinState extends Equatable {
  bool get isEnterPin => this is EnterPin;
  bool get isConfirmPin => this is ConfirmPin;
  bool get isError => this is PinError;
  bool get isSuccess => this is Success;

  const SetPinState();

  @override
  List<Object?> get props => [];
}

class EnterPin extends SetPinState {
  const EnterPin();
}

class ConfirmPin extends SetPinState {
  const ConfirmPin();
}

enum PinFieldError {
  doesNotMatch,
}

class PinError extends SetPinState {
  final PinFieldError error;

  const PinError(this.error);

  @override
  List<Object?> get props => [error];
}

class Submitting extends SetPinState {
  const Submitting();
}

class Success extends SetPinState {
  const Success();
}
