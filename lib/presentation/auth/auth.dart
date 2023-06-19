import 'package:go_router/go_router.dart';

import 'view/pin/pin_screen.dart';
import 'view/keys/set_keys_screen.dart';
import 'view/splash_screen.dart';

const splashRoutePath = '/splash';
const pinRoutePath = '/pin';
const setKeysRoutePath = '/set-keys';

final authRoutes = [
  GoRoute(
    path: splashRoutePath,
    pageBuilder: (context, state) {
      return const NoTransitionPage(
        child: SpashScreen(),
      );
    },
  ),
  GoRoute(
    path: pinRoutePath,
    pageBuilder: (context, state) {
      return NoTransitionPage(
        child: PinScreen(),
      );
    },
  ),
  GoRoute(
    path: setKeysRoutePath,
    builder: (context, state) {
      return SetKeysScreen();
    },
  ),
];
