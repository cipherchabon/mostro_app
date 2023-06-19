import 'package:go_router/go_router.dart';

import 'view/pin/enter_pin_screen.dart';
import 'view/pin/set_pin_screen.dart';
import 'view/keys/set_keys_screen.dart';
import 'view/splash_screen.dart';

const splashRoutePath = '/splash';
const setPinRoutePath = '/set-pin';
const enterPinRoutePath = '/enter-pin';
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
    path: enterPinRoutePath,
    pageBuilder: (context, state) {
      return const NoTransitionPage(
        child: EnterPinScreen(),
      );
    },
  ),
  GoRoute(
    path: setPinRoutePath,
    pageBuilder: (context, state) {
      return NoTransitionPage(
        child: SetPinScreen(),
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
