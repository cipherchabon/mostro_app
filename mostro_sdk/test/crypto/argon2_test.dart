import 'package:flutter_test/flutter_test.dart';
import 'package:mostro_sdk/crypto/argon2.dart';

void main() {
  test('generate salt', () {
    final salt = Argon2.generateSalt();
    expect(salt.length, 22);
  });

  test('hash password', () {
    final values = [
      (
        "7HZF67IrXPlnJ5b0H7MdAQ",
        r"$argon2id$v=19$m=19456,t=2,p=1$7HZF67IrXPlnJ5b0H7MdAQ$pALJ3I7Q3F/rPsHfhdw6RFM4ngvepFvXsQq/HgUglqA"
      ),
      (
        "irAd5WpFQ9JeMjnfCe1Mgw",
        r"$argon2id$v=19$m=19456,t=2,p=1$irAd5WpFQ9JeMjnfCe1Mgw$12qX5A6y5HVWcfA7j7++nlsf3KAQfiwFPB1mFwwPYvY"
      ),
      (
        "o5DWhFLF/i5GbbzjwKDDpQ",
        r"$argon2id$v=19$m=19456,t=2,p=1$o5DWhFLF/i5GbbzjwKDDpQ$pi950HTnymB39I/AowUETAoGWq807r4LH7qyQq58DyU"
      ),
    ];

    for (final value in values) {
      final hash = Argon2.hashPassword('password', value.$1);
      expect(hash.isOk(), true);
      expect(
        hash.unwrap(),
        value.$2,
      );
    }
  });

  test('derive encryption key', () {
    const key =
        r"$argon2id$v=19$m=19456,t=2,p=1$7HZF67IrXPlnJ5b0H7MdAQ$pALJ3I7Q3F/rPsHfhdw6RFM4ngvepFvXsQq/HgUglqA";
    const salt = "7HZF67IrXPlnJ5b0H7MdAQ";
    final res = Argon2.deriveEncryptionKey(key, salt);
    res.match((value) {
      expect(value, '7RH5XGiWzGkbo0X3CuOCAFn3Fa8IC2H5m5jQTqhs8Dc');
    }, (err) {
      fail(err.message);
    });
  });
}
