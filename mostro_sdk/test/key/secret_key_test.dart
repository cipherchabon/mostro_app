import 'package:flutter_test/flutter_test.dart';
import 'package:mostro_sdk/exceptions.dart';
import 'package:mostro_sdk/key/secret_key.dart';

void main() {
  test('valid secret key', () {
    const validSecretKeyAsString =
        'd47f517beeb6a60c7b5d49724a54c4a5e48830138293454db9923d6f31d78122';

    final sk = SecretKey.fromString(validSecretKeyAsString);

    expect(sk.toString(), validSecretKeyAsString);
  });

  test('invalid secret key', () {
    const invalidSecretKeyAsString = 'ivalid_secret_key_as_string';

    expect(
      () => SecretKey.fromString(invalidSecretKeyAsString),
      throwsA(isA<NativeException>()),
    );
  });

  test('secret key equality', () {
    const validSecretKeyAsString =
        'd47f517beeb6a60c7b5d49724a54c4a5e48830138293454db9923d6f31d78122';

    final sk1 = SecretKey.fromString(validSecretKeyAsString);
    final sk2 = SecretKey.fromString(validSecretKeyAsString);

    expect(sk1, sk2);
  });

  test('validate', () {
    const validSecretKey =
        '066f06c5267aae970bf0e5a0cdd8bdb008b434209711bbfebec924358da05e52';
    const invalidSecretKey = 'invalid secret key';

    expect(SecretKey.validate(validSecretKey).unwrap(), true);
    expect(SecretKey.validate(invalidSecretKey).isErr(), true);
  });
}
