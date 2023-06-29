import 'package:flutter_test/flutter_test.dart';
import 'package:mostro_sdk/key/keys.dart';

void main() {
  const hexPublicKey =
      '000024c81aba593a1788487de5b78e3bcdd6aab9d9c0ed25c1c3d764687a25d8';
  const hexSecretKey =
      'ec9d30d5f4402d09e4b213092d7b498d6ec4876be2fcd405969174ce7728f3a4';
  const bench32PublicKey =
      'npub1qqqzfjq6hfvn59ugfp77tduw80xad24em8qw6fwpc0tkg6r6yhvqm03cya';
  const bench32PrivateKey =
      'nsec1ajwnp405gqksne9jzvyj676f34hvfpmtut7dgpvkj96vuaeg7wjqvctvds';

  test('get KeyPair from hexSecretKey', () {
    final keyPair = KeyPair.fromSecretKey(hexSecretKey);
    expect(keyPair.publicKey.hex, hexPublicKey);
    expect(keyPair.publicKey.bench32, bench32PublicKey);
    expect(keyPair.secretKey!.hex, hexSecretKey);
    expect(keyPair.secretKey!.bench32, bench32PrivateKey);
  });

  test('get KeyPair from bench32SecretKey', () {
    final keyPair = KeyPair.fromSecretKey(bench32PrivateKey);
    expect(keyPair.publicKey.hex, hexPublicKey);
    expect(keyPair.publicKey.bench32, bench32PublicKey);
    expect(keyPair.secretKey!.hex, hexSecretKey);
    expect(keyPair.secretKey!.bench32, bench32PrivateKey);
  });

  test('get KeyPair from bench32PublicKey', () {
    final keyPair = KeyPair.fromPublicKey(bench32PublicKey);
    expect(keyPair.publicKey.hex, hexPublicKey);
    expect(keyPair.publicKey.bench32, bench32PublicKey);
    expect(keyPair.secretKey, null);
  });
}
