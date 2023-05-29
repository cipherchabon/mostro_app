import 'package:go_router/go_router.dart';

import 'home_view.dart';

const homeRoutePath = '/home';

final homeRoutes = [
  GoRoute(
    path: homeRoutePath,
    pageBuilder: (context, state) {
      return const NoTransitionPage(
        child: HomeView(),
      );
    },
  ),
];
