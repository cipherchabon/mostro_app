import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:ffi/ffi.dart';
import 'package:mostro_sdk/common.dart';
import 'package:mostro_sdk/native_result.dart';

import '../ffi_bindings.dart';

class SecretKey extends Equatable {
  final String hex;
  final String bench32;

  const SecretKey(this.hex, this.bench32);

  factory SecretKey.fromMap(Map<String, dynamic> json) {
    final {'hex': hex, 'bech32': bench32} = json;
    return SecretKey(hex, bench32);
  }

  Map toMap() {
    return {
      'hex': hex,
      'bech32': bench32,
    };
  }

  static bool validate(String value) {
    final nativeValue = value.toNative();
    final res = bindings.validate_secret_key(nativeValue).toDartResult();
    calloc.free(nativeValue);
    return res.when(
      success: (v) => v,
      failure: (_) => false,
    );
  }

  @override
  String toString() {
    return 'SecretKey{hex: ${hex.substring(0, 5)}...${hex.substring(hex.length - 5)}, bench32: ${bench32.substring(0, 5)}...${bench32.substring(bench32.length - 5)}}';
  }

  @override
  List<Object?> get props => [hex, bench32];
}

class PublicKey extends Equatable {
  final String hex;
  final String bench32;

  const PublicKey(this.hex, this.bench32);

  factory PublicKey.fromMap(Map<String, dynamic> json) {
    final {'hex': hex, 'bech32': bench32} = json;
    return PublicKey(hex, bench32);
  }

  Map toMap() {
    return {
      'hex': hex,
      'bech32': bench32,
    };
  }

  static bool validate(String value) {
    final nativeValue = value.toNative();
    final res = bindings.validate_public_key(nativeValue).toDartResult();
    calloc.free(nativeValue);
    return res.when(
      success: (v) => v,
      failure: (_) => false,
    );
  }

  @override
  String toString() {
    return 'PublicKey{hex: $hex, bench32: $bench32}';
  }

  @override
  List<Object?> get props => [hex, bench32];
}

class KeyPair extends Equatable {
  final SecretKey? secretKey;
  final PublicKey publicKey;

  const KeyPair(this.secretKey, this.publicKey);

  factory KeyPair.fromSecretKey(String value) {
    final nativeValue = value.toNative();
    final res = bindings.get_keys_from_sk_str(nativeValue).toDartResult();
    calloc.free(nativeValue);
    return res.when(
      success: (v) => KeyPair.fromMap(jsonDecode(v)),
      failure: (e) => throw e,
    );
  }

  factory KeyPair.fromPublicKey(String value) {
    final nativeValue = value.toNative();
    final res = bindings.get_keys_from_pk_str(nativeValue).toDartResult();
    calloc.free(nativeValue);
    return res.when(
      success: (v) => KeyPair.fromMap(jsonDecode(v)),
      failure: (e) => throw e,
    );
  }

  factory KeyPair.fromMap(Map<String, dynamic> json) {
    final {'secret_key': secretKey, 'public_key': publicKey} = json;
    return KeyPair(
      secretKey == null ? null : SecretKey.fromMap(secretKey),
      PublicKey.fromMap(publicKey),
    );
  }

  @override
  List<Object?> get props => [secretKey, publicKey];
}
