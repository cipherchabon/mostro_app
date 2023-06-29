import '../../domain/models/alias.dart';
import '../../domain/models/pin.dart';
import '../secure_local_storage.dart';

const _pinDataKey = '__pin_data__';

class LocalPinDataSource {
  final SecureLocalStorage storage;

  const LocalPinDataSource(this.storage);

  Future<Pin?> getPinData() async {
    final data = await storage.read<JsonMap>(_pinDataKey);
    return data != null ? Pin.fromJson(data) : null;
  }

  Future<void> setPinHashSalt(Pin pin) {
    return storage.write(_pinDataKey, pin.toJson());
  }
}
