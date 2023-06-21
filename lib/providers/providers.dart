import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/data_souces/native.dart';
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
PinLocalDataSource authLocalDataSource(AuthLocalDataSourceRef ref) {
  return PinLocalDataSource(
    ref.read(secureLocalStorageProvider),
  );
}

@Riverpod(keepAlive: true)
PinRepository authRepository(AuthRepositoryRef ref) {
  return PinRepository(
    ref.read(authLocalDataSourceProvider),
    ref.read(nativeDataSourceProvider),
  );
}

@Riverpod(keepAlive: true)
NativeDataSource nativeDataSource(NativeDataSourceRef ref) {
  return NativeDataSource();
}
