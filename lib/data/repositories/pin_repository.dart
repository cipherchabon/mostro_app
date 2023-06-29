import '../../domain/models/pin.dart';
import '../data_souces/native.dart';
import '../data_souces/pin_local.dart';

class PinRepository {
  final LocalPinDataSource localDataSource;

  const PinRepository(
    this.localDataSource,
  );

  Future<Pin?> getPin() {
    return localDataSource.getPinData();
  }

  Future<void> setPin(String pin) async {
    final salt = generateSalt();
    final hash = getPinHash(pin, salt);
    await localDataSource.setPinHashSalt(Pin(
      hash: hash,
      salt: salt,
      createdAt: DateTime.now(),
    ));
  }

  bool checkPin(String value, Pin pin) {
    final hash = getPinHash(value, pin.salt);
    return hash == pin.hash;
  }
}
