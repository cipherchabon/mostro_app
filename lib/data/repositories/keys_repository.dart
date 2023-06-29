import '../../domain/models/keys.dart';
import '../data_souces/keys_local.dart';
import 'pin_repository.dart';

class KeysRepository {
  final LocalKeysDataSource localDataSource;
  final PinRepository pinRepository;

  const KeysRepository(
    this.localDataSource,
    this.pinRepository,
  );

  Future<Set<SecureKeyPair>> getSecureKeys() {
    return localDataSource.getSecureKeys();
  }

  Future<void> saveSecureKeyPair(SecureKeyPair keyPair) async {
    await localDataSource.saveSecureKey(keyPair);
  }
}
