import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:mostro_sdk/mostro_sdk.dart';

class SecureKeyPair extends Equatable {
  final String label;
  final PublicKey publicKey;
  final EncryptedData? encryptedData;

  const SecureKeyPair({
    required this.label,
    required this.publicKey,
    required this.encryptedData,
  });

  factory SecureKeyPair.fromMap(Map<String, dynamic> map) {
    return SecureKeyPair(
      label: map['label'],
      publicKey: PublicKey.fromMap(map['public_key']),
      encryptedData: EncryptedData.fromMap(map['encrypted_data']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'public_key': publicKey.toMap(),
      'encrypted_data': encryptedData?.toMap(),
    };
  }

  factory SecureKeyPair.fromJson(String source) =>
      SecureKeyPair.fromMap(jsonDecode(source));

  String toJson() => jsonEncode(toMap());

  @override
  String toString() {
    return 'SecureKeyPair(label: $label, publicKey: ${publicKey.bench32})';
  }

  @override
  List<Object?> get props => [label, publicKey, encryptedData];
}
