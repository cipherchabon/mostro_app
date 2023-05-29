import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:mostro_sdk/crypto/aes.dart';

void main() {
  test('encrypt with aes', () {
    const key = "7RH5XGiWzGkbo0X3CuOCAFn3Fa8IC2H5m5jQTqhs8Dc";
    const data = 'my secret data';

    final res = Aes.encrypt(key, data);
    res.when(
      ok: (data) {
        final res = Aes.decrypt(key, data);
        res.when(
          ok: (data) {
            expect(data, key);
          },
          err: (e) => log(e.message),
        );
      },
      err: (e) => log(e.message),
    );
  });
}
