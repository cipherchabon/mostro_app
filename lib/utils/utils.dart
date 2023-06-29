import 'package:mostro_sdk/mostro_sdk.dart';

/// Valid if the value is a hexadecimal value and has 64 characters.
bool is256bitHexadecimalValue(String valor) {
  final hexRegex = RegExp(r'^[0-9a-fA-F]{64}$');
  return hexRegex.hasMatch(valor);
}

/// Valid if the prefix is nsec1 and has 58 characters.
bool isNSecFormatValid(String valor) {
  final nsec1Regex = RegExp(r'^nsec1[0-9a-zA-Z]{58}$');
  return nsec1Regex.hasMatch(valor);
}

/// Valid if the prefix is npub1 and has 58 characters.
bool isNPubFormatValid(String valor) {
  final npub1Regex = RegExp(r'^npub1[0-9a-zA-Z]{58}$');
  return npub1Regex.hasMatch(valor);
}

bool isValidSecretKey(String value) {
  if (is256bitHexadecimalValue(value) || isNSecFormatValid(value)) {
    return SecretKey.validate(value);
  }
  return false;
}

bool isValidPublicKey(String value) {
  if (isNPubFormatValid(value)) {
    return PublicKey.validate(value);
  }
  return false;
}

String truncateString(String str, {int? n}) {
  n = n ?? (str.length ~/ 5);

  if (str.length <= n) {
    return str;
  }

  return '${str.substring(0, n)}...${str.substring(str.length - n)}';
}
