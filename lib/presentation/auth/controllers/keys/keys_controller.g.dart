// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keys_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$keyFieldControllerHash() =>
    r'7b3ea666cba7dfc079447a1c57f7a3a6d910e6c6';

/// See also [keyFieldController].
@ProviderFor(keyFieldController)
final keyFieldControllerProvider =
    AutoDisposeProvider<TextEditingController>.internal(
  keyFieldController,
  name: r'keyFieldControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$keyFieldControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef KeyFieldControllerRef = AutoDisposeProviderRef<TextEditingController>;
String _$keyFieldValueHash() => r'7bebc3be8bdd51b3fcb419a76c14bdba2c67f505';

/// See also [keyFieldValue].
@ProviderFor(keyFieldValue)
final keyFieldValueProvider = AutoDisposeStreamProvider<String>.internal(
  keyFieldValue,
  name: r'keyFieldValueProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$keyFieldValueHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef KeyFieldValueRef = AutoDisposeStreamProviderRef<String>;
String _$keysHash() => r'05cc8fd9011fc38a37081b17f42cc75ddca825bd';

/// See also [Keys].
@ProviderFor(Keys)
final keysProvider = AsyncNotifierProvider<Keys, Set<SecureKeyPair>>.internal(
  Keys.new,
  name: r'keysProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$keysHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Keys = AsyncNotifier<Set<SecureKeyPair>>;
String _$keysScreenControllerHash() =>
    r'63d0fe6d37173eedf4480edfe20a76697b9bf47e';

/// See also [KeysScreenController].
@ProviderFor(KeysScreenController)
final keysScreenControllerProvider =
    AutoDisposeNotifierProvider<KeysScreenController, KeysScreenState>.internal(
  KeysScreenController.new,
  name: r'keysScreenControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$keysScreenControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$KeysScreenController = AutoDisposeNotifier<KeysScreenState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
