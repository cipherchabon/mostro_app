import 'dart:convert';

import '../../domain/models/keys.dart';
import 'package:mostro_sdk/mostro_sdk.dart';

import '../data_souces/native.dart';

extension KeyPairExtension on KeyPair {
  SecureKeyPair toSecureKeyPair(String label, String pinHash) {
    EncryptedData? encryptedData;

    final sk = secretKey;

    if (sk != null) {
      final salt = generateSalt();

      final res = Argon2.deriveEncryptionKey(pinHash, salt);

      res.when(
        success: (key) {
          final res = Aes.encrypt(key, jsonEncode(sk.toMap()));
          res.when(
            success: (data) {
              return encryptedData = data;
            },
            failure: (e) => throw e,
          );
        },
        failure: (err) => throw err,
      );
    }

    return SecureKeyPair(
      label: label,
      publicKey: publicKey,
      encryptedData: encryptedData,
    );
  }
}
