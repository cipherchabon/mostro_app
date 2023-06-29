import 'package:flutter_test/flutter_test.dart';
import 'package:mostro_app/utils/utils.dart';

const validHexadecimalValue = [
  '000024c81aba593a1788487de5b78e3bcdd6aab9d9c0ed25c1c3d764687a25d8',
  'ec9d30d5f4402d09e4b213092d7b498d6ec4876be2fcd405969174ce7728f3a4',
  '00001b3dc9a5d635b41c960d4cb0f7a3f8f53d667262c1c24d394afb911d9b21',
  '39edc51b4dd93eb7553fd9afa078a192902080ed6405f776c0e661d01cfb9a04',
  '000004b7caf1cffa167bc47bbe6ad4167e70589f8ae120cbe865dce0b0eef629',
  '4dfa6cf23a9b7ca0ee1c97a1aeb21b9750ef81e44e54e59fcb189b7ecaf190a6',
  '000003bc8ce83d085f6342545298b7ccfd7eafc3cadf4c2974687781f2c7c3c4',
  'fbf33d181f7bbc474c771ff29465aec2b209e2c0d1b9e8e53aeee39938da776f',
  '000001f429d5118efd042ca3d47023a5852cd1ae3052687cef0904084669909d',
  '1a7c9aba09b5a22b360dbc76fe4e3e167b4bcea28283e0ffdea1813aa4572f63',
  '000000e8550bc13ecbf26cf5290455cfa8cc635553b2fb2724f684ac3d47d84e',
  '795612e10f67d66f22823f6ed27b9613fd1268e51412a7c1542f53fb7267b272',
];

const validNPubKeys = [
  'npub1qqqzfjq6hfvn59ugfp77tduw80xad24em8qw6fwpc0tkg6r6yhvqm03cya',
  'npub1qqqpk0wf5htrtdqujcx5ev8h50u020txwf3vrsjd8990hyganvss89xf7u',
  'npub1qqqqfd72788l59nmc3amu6k5zel8qkyl3tsjpjlgvhwwpv8w7c5sgksh75',
  'npub1qqqq80yvaq7sshmrgf299x9hen7hat7ret05c2t5dpmcruk8c0zqg49k2y',
  'npub1qqqqrapf65gcalgy9j3agupr5kzje5dwxpfxsl80pyzqs3nfjzwsa4lyw7',
  'npub1qqqqp6z4p0qnajljdn6jjpz4e75vcc642we0kfey76z2c028mp8qay5n4d',
];

const validNSecKeys = [
  'nsec1ajwnp405gqksne9jzvyj676f34hvfpmtut7dgpvkj96vuaeg7wjqvctvds',
  'nsec188ku2x6dmyltw4flmxh6q79pj2gzpq8dvszlwakquesaq88mngzqa9hz2q',
  'nsec1fhaxeu36nd72pmsuj7s6avsmjagwlq0yfe2wt87trzdhajh3jznqnmc2s9',
  'nsec1l0en6xql0w7ywnrhrlefgedwc2eqnckq6xu73ef6am3ejwx6wahsj8egew',
  'nsec1rf7f4wsfkk3zkdsdh3m0un37zea5hn4zs2p7pl775xqn4fzh9a3s88tgjd',
  'nsec109tp9cg0vltx7g5z8ahdy7ukz073y689zsf20s259aflkun8kfeqs3jvaf',
];

void main() {
  test('is valid hexadecimal value', () {
    for (var value in validHexadecimalValue) {
      expect(is256bitHexadecimalValue(value), true);
    }
  });
  test('is valid npub value key', () {
    for (var value in validNPubKeys) {
      expect(isNPubFormatValid(value), true);
    }
  });

  test('is valid nsec value key', () {
    for (var value in validNSecKeys) {
      expect(isNSecFormatValid(value), true);
    }
  });
}
