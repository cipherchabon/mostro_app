import '../../domain/models/pin.dart';
import '../data_souces/native.dart';
import '../data_souces/pin_local.dart';

class PinRepository {
  final PinLocalDataSource localDataSource;
  final NativeDataSource nativeDataSource;

  const PinRepository(
    this.localDataSource,
    this.nativeDataSource,
  );

  Future<Pin?> getPin() {
    return localDataSource.getPinData();
  }

  Future<void> setPin(String pin) async {
    final salt = nativeDataSource.generateSalt();
    final hash = nativeDataSource.getPinHash(pin, salt);
    await localDataSource.setPinHashSalt(Pin(
      hash: hash,
      salt: salt,
      createdAt: DateTime.now(),
    ));
  }

  bool checkPin(String value, Pin pin) {
    final hash = nativeDataSource.getPinHash(value, pin.salt);
    return hash == pin.hash;
  }
}
