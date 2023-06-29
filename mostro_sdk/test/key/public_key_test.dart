import 'package:flutter_test/flutter_test.dart';
import 'package:mostro_sdk/key/keys.dart';

void main() {
  test('validate public key', () {
    final values = [
      '000024c81aba593a1788487de5b78e3bcdd6aab9d9c0ed25c1c3d764687a25d8',
      'npub1qqqzfjq6hfvn59ugfp77tduw80xad24em8qw6fwpc0tkg6r6yhvqm03cya',
      '00001b3dc9a5d635b41c960d4cb0f7a3f8f53d667262c1c24d394afb911d9b21',
      'npub1qqqpk0wf5htrtdqujcx5ev8h50u020txwf3vrsjd8990hyganvss89xf7u',
      '000004b7caf1cffa167bc47bbe6ad4167e70589f8ae120cbe865dce0b0eef629',
      'npub1qqqqfd72788l59nmc3amu6k5zel8qkyl3tsjpjlgvhwwpv8w7c5sgksh75',
      '000003bc8ce83d085f6342545298b7ccfd7eafc3cadf4c2974687781f2c7c3c4',
      'npub1qqqq80yvaq7sshmrgf299x9hen7hat7ret05c2t5dpmcruk8c0zqg49k2y',
      '000001f429d5118efd042ca3d47023a5852cd1ae3052687cef0904084669909d',
      'npub1qqqqrapf65gcalgy9j3agupr5kzje5dwxpfxsl80pyzqs3nfjzwsa4lyw7',
      '000000e8550bc13ecbf26cf5290455cfa8cc635553b2fb2724f684ac3d47d84e',
      'npub1qqqqp6z4p0qnajljdn6jjpz4e75vcc642we0kfey76z2c028mp8qay5n4d',
    ];

    for (final value in values) {
      expect(PublicKey.validate(value), true);
    }
  });
}
