import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mostro_app/data/repositories/keys_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/data_souces/keys_local.dart';
import '../data/data_souces/pin_local.dart';
import '../data/repositories/pin_repository.dart';
import '../data/secure_local_storage.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
FlutterSecureStorage flutterSecureStorage(FlutterSecureStorageRef ref) {
  const storage = FlutterSecureStorage();
  // storage.deleteAll();
  return storage;
}

@Riverpod(keepAlive: true)
SecureLocalStorage secureLocalStorage(SecureLocalStorageRef ref) {
  return SecureLocalStorage(
    ref.read(flutterSecureStorageProvider),
  );
}

@Riverpod(keepAlive: true)
LocalPinDataSource authLocalDataSource(AuthLocalDataSourceRef ref) {
  return LocalPinDataSource(
    ref.read(secureLocalStorageProvider),
  );
}

@Riverpod(keepAlive: true)
PinRepository authRepository(AuthRepositoryRef ref) {
  return PinRepository(
    ref.read(authLocalDataSourceProvider),
  );
}

@Riverpod(keepAlive: true)
LocalKeysDataSource keysLocalDataSource(KeysLocalDataSourceRef ref) {
  return LocalKeysDataSource(
    ref.read(secureLocalStorageProvider),
  );
}

@Riverpod(keepAlive: true)
KeysRepository keysRepository(KeysRepositoryRef ref) {
  return KeysRepository(
    ref.read(keysLocalDataSourceProvider),
    ref.read(authRepositoryProvider),
  );
}
