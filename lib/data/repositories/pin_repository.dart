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

  Future<bool> isPinSet() async {
    final pinData = await localDataSource.getPinData();
    return pinData != null;
  }

  Future<void> setPin(String pin) async {
    final salt = await nativeDataSource.generateSalt();
    final hash = await nativeDataSource.getPinHash(pin, salt);
    await localDataSource.setPinHashSalt(Pin(
      hash: hash,
      salt: salt,
      createdAt: DateTime.now(),
    ));
  }
}
