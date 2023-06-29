import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:mostro_sdk/crypto/aes.dart';

void main() {
  test('encrypt with aes', () {
    const key = "7RH5XGiWzGkbo0X3CuOCAFn3Fa8IC2H5m5jQTqhs8Dc";
    const data = 'my secret data';

    final res = Aes.encrypt(key, data);
    res.when(
      success: (data) {
        final res = Aes.decrypt(data);
        res.when(
          success: (data) {
            expect(data, key);
          },
          failure: (e) => log(e.message),
        );
      },
      failure: (e) => log(e.message),
    );
  });
}
