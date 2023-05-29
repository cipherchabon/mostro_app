import 'package:mostro_sdk/mostro_sdk.dart';

import '../../domain/exceptions/app_exceptions.dart';

class NativeDataSource {
  Future<String> generateSalt() async {
    try {
      return Argon2.generateSalt();
    } catch (e) {
      throw AppException.native(e.toString());
    }
  }

  Future<String> getPinHash(String pin, String salt) async {
    final result = Argon2.hashPassword(pin, salt);
    return result.when(
      ok: (h) => h,
      err: (e) => throw AppException.native(e.message),
    );
  }
}
