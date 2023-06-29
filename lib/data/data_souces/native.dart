import 'package:mostro_sdk/mostro_sdk.dart';

import '../../domain/exceptions/app_exceptions.dart';

String generateSalt() {
  try {
    return Argon2.generateSalt();
  } catch (e) {
    throw AppException.native(e.toString());
  }
}

String getPinHash(String pin, String salt) {
  final result = Argon2.hashPassword(pin, salt);
  return result.when(
    success: (h) => h,
    failure: (e) => throw AppException.native(e.message),
  );
}

String getEncryptionKey(String key, String salt) {
  final result = Argon2.deriveEncryptionKey(key, salt);
  return result.when(
    success: (h) => h,
    failure: (e) => throw AppException.native(e.message),
  );
}
