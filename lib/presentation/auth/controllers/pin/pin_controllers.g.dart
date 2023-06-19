// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_controllers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pinFocusNodeHash() => r'04b9a676119465c77298e8ff2325c48897aef967';

/// See also [pinFocusNode].
@ProviderFor(pinFocusNode)
final pinFocusNodeProvider = AutoDisposeProvider<FocusNode>.internal(
  pinFocusNode,
  name: r'pinFocusNodeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$pinFocusNodeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PinFocusNodeRef = AutoDisposeProviderRef<FocusNode>;
String _$pinFieldControllerHash() =>
    r'976a106ebdc7e869b60ccb29568dd005df758939';

/// See also [pinFieldController].
@ProviderFor(pinFieldController)
final pinFieldControllerProvider =
    AutoDisposeProvider<TextEditingController>.internal(
  pinFieldController,
  name: r'pinFieldControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pinFieldControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PinFieldControllerRef = AutoDisposeProviderRef<TextEditingController>;
String _$confirmPinFieldControllerHash() =>
    r'5712eb35959689331aef8be370d01e83790815cb';

/// See also [confirmPinFieldController].
@ProviderFor(confirmPinFieldController)
final confirmPinFieldControllerProvider =
    AutoDisposeProvider<TextEditingController>.internal(
  confirmPinFieldController,
  name: r'confirmPinFieldControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$confirmPinFieldControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ConfirmPinFieldControllerRef
    = AutoDisposeProviderRef<TextEditingController>;
String _$pinValueHash() => r'085306d25f158f17ba7c455aea943aeac000ef12';

/// See also [pinValue].
@ProviderFor(pinValue)
final pinValueProvider = AutoDisposeStreamProvider<String>.internal(
  pinValue,
  name: r'pinValueProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$pinValueHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PinValueRef = AutoDisposeStreamProviderRef<String>;
String _$confirmPinValueHash() => r'4011f8712ee9a087976a723cf380ce8d4e28eb62';

/// See also [confirmPinValue].
@ProviderFor(confirmPinValue)
final confirmPinValueProvider = AutoDisposeStreamProvider<String>.internal(
  confirmPinValue,
  name: r'confirmPinValueProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$confirmPinValueHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ConfirmPinValueRef = AutoDisposeStreamProviderRef<String>;
String _$pinControllerHash() => r'9f6c36dfe7cc4817b0571ab080e99d81faa99245';

/// See also [PinController].
@ProviderFor(PinController)
final pinControllerProvider =
    AsyncNotifierProvider<PinController, Pin?>.internal(
  PinController.new,
  name: r'pinControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pinControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PinController = AsyncNotifier<Pin?>;
String _$setPinScreenControllerHash() =>
    r'0ad4d8d4dd070f68c362975375ce1dc4c6cae705';

/// See also [SetPinScreenController].
@ProviderFor(SetPinScreenController)
final setPinScreenControllerProvider =
    AutoDisposeNotifierProvider<SetPinScreenController, SetPinState>.internal(
  SetPinScreenController.new,
  name: r'setPinScreenControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$setPinScreenControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SetPinScreenController = AutoDisposeNotifier<SetPinState>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
