import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../auth/auth.dart';
import '../../chat/chat.dart';
import '../../home/home.dart';
import '../../notifications/notifications.dart';
import '../../orders/orders.dart';
import '../../shell/shell_scaffold.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final mainRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: splashRoutePath,
  redirect: (context, state) {
    return null;
  },
  routes: [
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (context, state, child) => ShellScaffold(
        child: child,
      ),
      routes: [
        ...homeRoutes,
        ...chatRoutes,
        ...notificationsRoutes,
        ...ordersRoutes,
      ],
    ),
    ...authRoutes,
  ],
);
