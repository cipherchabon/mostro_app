import 'package:flutter_test/flutter_test.dart';
import 'package:mostro_sdk/key/keys.dart';

void main() {
  test('keys generate', () {
    final keys = Keys.generate();
    expect(keys.publicKey().toString(), isNotEmpty);
    expect(keys.secretKey().isSome(), true);
    expect(keys.secretKey().unwrap().toString(), isNotEmpty);
  });

  test('keys from secret key', () {
    final keys = Keys.generate();
    final sk = keys.secretKey().unwrap();
    final keys2 = Keys.fromSecretKey(sk);
    expect(keys2.publicKey().toString(), isNotEmpty);
    expect(keys2.secretKey().isSome(), true);
    expect(keys2.secretKey().unwrap().toString(), isNotEmpty);
  });

  test('keys from public key', () {
    final keys = Keys.generate();
    final pk = keys.publicKey();
    final keys2 = Keys.fromPublicKey(pk);
    expect(keys2.publicKey().toString(), isNotEmpty);
    expect(keys2.secretKey().isSome(), false);
  });

  test('keys equality', () {
    final keys = Keys.generate();
    final keys2 = Keys.fromSecretKey(keys.secretKey().unwrap());
    expect(keys, keys2);
  });
}
