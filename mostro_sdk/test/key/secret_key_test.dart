import 'package:flutter_test/flutter_test.dart';
import 'package:mostro_sdk/key/keys.dart';

void main() {
  test('validate secret key', () {
    final values = [
      'ec9d30d5f4402d09e4b213092d7b498d6ec4876be2fcd405969174ce7728f3a4',
      'nsec1ajwnp405gqksne9jzvyj676f34hvfpmtut7dgpvkj96vuaeg7wjqvctvds',
      '39edc51b4dd93eb7553fd9afa078a192902080ed6405f776c0e661d01cfb9a04',
      'nsec188ku2x6dmyltw4flmxh6q79pj2gzpq8dvszlwakquesaq88mngzqa9hz2q',
      '4dfa6cf23a9b7ca0ee1c97a1aeb21b9750ef81e44e54e59fcb189b7ecaf190a6',
      'nsec1fhaxeu36nd72pmsuj7s6avsmjagwlq0yfe2wt87trzdhajh3jznqnmc2s9',
      'fbf33d181f7bbc474c771ff29465aec2b209e2c0d1b9e8e53aeee39938da776f',
      'nsec1l0en6xql0w7ywnrhrlefgedwc2eqnckq6xu73ef6am3ejwx6wahsj8egew',
      '1a7c9aba09b5a22b360dbc76fe4e3e167b4bcea28283e0ffdea1813aa4572f63',
      'nsec1rf7f4wsfkk3zkdsdh3m0un37zea5hn4zs2p7pl775xqn4fzh9a3s88tgjd',
      '795612e10f67d66f22823f6ed27b9613fd1268e51412a7c1542f53fb7267b272',
      'nsec109tp9cg0vltx7g5z8ahdy7ukz073y689zsf20s259aflkun8kfeqs3jvaf',
    ];

    for (final value in values) {
      expect(SecretKey.validate(value), true);
    }
  });
}
