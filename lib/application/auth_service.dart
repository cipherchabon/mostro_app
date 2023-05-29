import '../data/repositories/pin_repository.dart';

class AuthService {
  final PinRepository authRepository;

  const AuthService(this.authRepository);

  Future<bool> isPinSet() {
    return authRepository.isPinSet();
  }

  Future<void> setPin(String pin) async {
    await authRepository.setPin(pin);
  }
}
