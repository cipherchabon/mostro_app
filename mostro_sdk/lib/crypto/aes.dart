import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:ffi/ffi.dart';
import 'package:mostro_sdk/common.dart';
import 'package:mostro_sdk/native_result.dart';

import '../exceptions.dart';
import '../ffi_bindings.dart';

class Aes {
  Aes._();

  /// Encrypts data using the AES-GCM-SIV algorithm.
  static Result<EncryptedData, NativeException> encrypt(
    String key,
    String data,
  ) {
    final nativeKey = key.toNative();
    final nativeData = data.toNative();
    final result = bindings.encrypt(nativeKey, nativeData);
    calloc.free(nativeKey);
    calloc.free(nativeData);
    return switch (result.toDartResult()) {
      (Success(value: final json)) => Success(EncryptedData.fromJson(json)),
      (Failure(exception: final e)) => Failure(e),
    };
  }

  /// Decrypts data using the AES-GCM-SIV algorithm.
  static Result<String, NativeException> decrypt(EncryptedData data) {
    final nativeData = data.toJson().toNative();
    final result = bindings.decrypt(nativeData);
    calloc.free(nativeData);
    return result.toDartResult();
  }
}

class EncryptedData extends Equatable {
  final String cipherValue;
  final String encryptionKey;
  final String nonce;

  const EncryptedData({
    required this.cipherValue,
    required this.encryptionKey,
    required this.nonce,
  });

  factory EncryptedData.fromMap(Map<String, dynamic> json) {
    final {
      'cipher_value': cypherValue,
      'encryption_key': encryptionKey,
      'nonce': nonce
    } = json;
    return EncryptedData(
      cipherValue: cypherValue,
      encryptionKey: encryptionKey,
      nonce: nonce,
    );
  }

  factory EncryptedData.fromJson(String json) {
    return EncryptedData.fromMap(jsonDecode(json));
  }

  Map<String, dynamic> toMap() {
    return {
      'cipher_value': cipherValue,
      'encryption_key': encryptionKey,
      'nonce': nonce,
    };
  }

  String toJson() => jsonEncode(toMap());

  @override
  List<Object?> get props => [cipherValue, encryptionKey, nonce];
}
