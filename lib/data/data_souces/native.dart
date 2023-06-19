import 'package:mostro_sdk/mostro_sdk.dart';

import '../../domain/exceptions/app_exceptions.dart';

class NativeDataSource {
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
      ok: (h) => h,
      err: (e) => throw AppException.native(e.message),
    );
  }
}
