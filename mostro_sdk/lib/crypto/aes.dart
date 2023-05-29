import 'dart:convert';

import 'package:ffi/ffi.dart';
import 'package:mostro_sdk/common.dart';
import 'package:mostro_sdk/native_result.dart';
import 'package:oxidized/oxidized.dart';

import '../exceptions.dart';
import '../ffi_bindings.dart';

class Aes {
  Aes._();

  /// Encrypts data using the AES-GCM-SIV algorithm.
  static Result<CipherData, NativeException> encrypt(String key, String data) {
    final nativeKey = key.toNative();
    final nativeData = data.toNative();
    final result = bindings.encrypt(nativeKey, nativeData);
    calloc.free(nativeKey);
    calloc.free(nativeData);
    return result.toDartResult().map((json) => CipherData.fromJson(json));
  }

  /// Decrypts data using the AES-GCM-SIV algorithm.
  static Result<String, NativeException> decrypt(String key, CipherData data) {
    final nativeKey = key.toNative();
    final nativeData = data.toJson().toNative();
    final result = bindings.decrypt(nativeKey, nativeData);
    calloc.free(nativeKey);
    calloc.free(nativeData);
    return result.toDartResult();
  }
}

class CipherData {
  final String cyphertext;
  final String nonce;

  const CipherData(this.cyphertext, this.nonce);

  factory CipherData.fromMap(Map<String, dynamic> json) {
    final {'cyphertext': cyphertext, 'nonce': nonce} = json;
    return CipherData(cyphertext, nonce);
  }

  factory CipherData.fromJson(String json) {
    return CipherData.fromMap(jsonDecode(json));
  }

  Map<String, dynamic> toMap() => {
        'cyphertext': cyphertext,
        'nonce': nonce,
      };

  String toJson() => jsonEncode(toMap());
}
