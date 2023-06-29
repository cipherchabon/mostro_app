import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import '../../../../data/repositories/keys_repository.dart';
import '../../../../data/utils/extensions.dart';
import '../pin/pin_controllers.dart';
import '../../../../providers/providers.dart';
import 'package:mostro_sdk/mostro_sdk.dart';
import '../../../../domain/models/keys.dart';
import '../../../../utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../widgets/widgets.dart' show TextEditingController;

part 'keys_controller.g.dart';

@Riverpod(keepAlive: true)
class Keys extends _$Keys {
  KeysRepository get repo => ref.read(keysRepositoryProvider);
  @override
  Future<Set<SecureKeyPair>> build() => repo.getSecureKeys();

  void addKey(SecureKeyPair keyPair) async {
    final currentKeys = {...state.value ?? {}};
    state = AsyncData({...currentKeys, keyPair});
    repo.saveSecureKeyPair(keyPair);
  }
}

@riverpod
TextEditingController keyFieldController(KeyFieldControllerRef ref) {
  final controller = TextEditingController();
  ref.onDispose(() {
    controller.dispose();
  });
  return controller;
}

@riverpod
Stream<String> keyFieldValue(KeyFieldValueRef ref) {
  final streamController = StreamController<String>();
  final field = ref.watch(keyFieldControllerProvider);

  ref.onDispose(() {
    streamController.close();
  });

  field.addListener(() {
    streamController.add(field.text.trim().toLowerCase());
  });

  return streamController.stream;
}

@riverpod
class KeysScreenController extends _$KeysScreenController {
  KeysRepository get repo => ref.read(keysRepositoryProvider);

  @override
  KeysScreenState build() {
    final keys = ref.watch(keysProvider).value ?? {};
    if (keys.isNotEmpty) {
      return const Success();
    }

    ref.listen(keyFieldValueProvider, (_, next) {
      next.whenData(onKeyFieldChanged);
    });
    return const EnterKey();
  }

  void onKeyFieldChanged(String value) {
    if (value.isNotEmpty) {
      if (isValidPublicKey(value)) {
        whenIsPublicKey(value);
      } else if (isValidSecretKey(value)) {
        whenIsSecretKey(value);
      } else {
        state = const KeyFieldError(KeyFieldErrorType.invalid);
      }
    } else {
      state = const EnterKey();
    }
  }

  void whenIsPublicKey(String value) {
    final keyPair = KeyPair.fromPublicKey(value);
    state = EnterKey(keyPair: keyPair);
  }

  void whenIsSecretKey(String value) {
    final keyPair = KeyPair.fromSecretKey(value);
    state = EnterKey(keyPair: keyPair);
  }

  void setKeys() async {
    final keyPair = state.keyPair;
    state = const Submitting();
    if (keyPair != null) {
      try {
        final pin = ref.watch(pinProvider).value!;
        final secureKeyPair = keyPair.toSecureKeyPair('default', pin.hash);
        ref.read(keysProvider.notifier).addKey(secureKeyPair);
        state = const Success();
      } catch (e) {
        log(e.toString());
        state = Error(e.toString());
      }
    } else {
      state = Error('Cannot save empty key pair');
    }
  }
}

sealed class KeysScreenState extends Equatable {
  bool get isEnterKey => this is EnterKey;
  bool get keyFieldHasError => this is KeyFieldError;
  bool get isSubmitting => this is Submitting;
  bool get isSuccess => this is Success;
  bool get isError => this is Error;

  KeyPair? get keyPair => isEnterKey ? (this as EnterKey).keyPair : null;

  const KeysScreenState();

  @override
  List<Object?> get props => [];
}

class EnterKey extends KeysScreenState {
  @override
  final KeyPair? keyPair;

  const EnterKey({this.keyPair});

  @override
  List<Object?> get props => [keyPair];
}

enum KeyFieldErrorType { invalid }

class KeyFieldError extends KeysScreenState {
  final KeyFieldErrorType error;

  const KeyFieldError(this.error);

  @override
  List<Object?> get props => [error];
}

class Error extends KeysScreenState {
  final String message;

  const Error(this.message);

  @override
  List<Object?> get props => [message];
}

class Submitting extends KeysScreenState {
  const Submitting();
}

class Success extends KeysScreenState {
  const Success();
}
