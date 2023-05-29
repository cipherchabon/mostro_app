import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mostro_app/domain/models/alias.dart';

import '../domain/exceptions/app_exceptions.dart';

class SecureLocalStorage {
  final FlutterSecureStorage storage;

  const SecureLocalStorage(this.storage);

  Future<T?> read<T>(String key) async {
    try {
      if (T != String && T != JsonMap && T != JsonList) {
        throw LocalStorageException.unexpectedType(
          'T must be String, JsonMap or JsonList',
        );
      }

      final res = await storage.read(key: key);
      if (res == null) return null;

      if (T == String) {
        return res as T;
      }

      final data = jsonDecode(res);

      if (data is! T) {
        throw LocalStorageException.unexpectedType(
          'Unexpected type for key $key: ${T.runtimeType}',
        );
      }

      return data;
    } on FormatException catch (e) {
      throw LocalStorageException.format(
        'Error parsing data for key $key: $e',
      );
    } catch (e) {
      throw AppException.unexpected(e.toString());
    }
  }

  Future<void> write<T>(String key, T value) async {
    try {
      await storage.write(key: key, value: jsonEncode(value));
    } catch (e) {
      throw AppException.unexpected(e.toString());
    }
  }

  Future<void> delete(String key) async {
    try {
      await storage.delete(key: key);
    } catch (e) {
      throw AppException.unexpected(e.toString());
    }
  }

  Future<void> deleteAll() async {
    try {
      await storage.deleteAll();
    } catch (e) {
      throw AppException.unexpected(e.toString());
    }
  }
}
