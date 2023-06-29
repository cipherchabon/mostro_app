import '../../domain/models/alias.dart';
import '../../domain/models/keys.dart';
import '../secure_local_storage.dart';

const _secureKeysSetKey = '__secure_keys_set__';

class LocalKeysDataSource {
  final SecureLocalStorage storage;

  const LocalKeysDataSource(this.storage);

  Future<Set<SecureKeyPair>> getSecureKeys() async {
    final data = await storage.read<JsonList>(_secureKeysSetKey);
    return data != null
        ? data.map((e) => SecureKeyPair.fromMap(e)).toSet()
        : {};
  }

  Future<void> saveSecureKey(SecureKeyPair keyPair) async {
    final keys = await getSecureKeys();
    if (keys.contains(keyPair)) keys.remove(keyPair);
    keys.add(keyPair);
    return saveSecureKeys(keys);
  }

  Future<void> saveSecureKeys(Set<SecureKeyPair> keys) async {
    return storage.write<JsonList>(
      _secureKeysSetKey,
      keys.map((e) => e.toMap()).toList(),
    );
  }
}
