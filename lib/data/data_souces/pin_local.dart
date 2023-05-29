import '../../domain/models/alias.dart';
import '../../domain/models/pin.dart';
import '../secure_local_storage.dart';

const _pinDataKey = '__pin_data__';

class PinLocalDataSource {
  final SecureLocalStorage storage;

  const PinLocalDataSource(this.storage);

  Future<Pin?> getPinData() async {
    final data = await storage.read<JsonMap>(_pinDataKey);
    return data != null ? Pin.fromJson(data) : null;
  }

  Future<void> setPinHashSalt(Pin pin) {
    return storage.write(_pinDataKey, pin.toJson());
  }
}
