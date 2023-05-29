import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../application/auth_service.dart';
import '../../../providers/providers.dart';
import '../model/state.dart';

part 'controller.g.dart';

@Riverpod(keepAlive: true)
class AppController extends _$AppController {
  AuthService get authService => ref.read(authServiceProvider);

  @override
  Future<AppState> build() async {
    final isPinSet = await authService.isPinSet();
    return AppState(pinSeted: isPinSet);
  }
}
