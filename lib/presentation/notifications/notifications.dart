import 'package:go_router/go_router.dart';

import 'notifications_view.dart';

const notificationsRoutePath = '/notifications';

final notificationsRoutes = [
  GoRoute(
    path: notificationsRoutePath,
    pageBuilder: (context, state) {
      return const NoTransitionPage(
        child: NotificationsView(),
      );
    },
  ),
];
