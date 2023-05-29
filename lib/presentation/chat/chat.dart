import 'package:go_router/go_router.dart';

import 'chat_view.dart';

const chatRoutePath = '/chat';

final chatRoutes = [
  GoRoute(
    path: chatRoutePath,
    pageBuilder: (context, state) {
      return const NoTransitionPage(
        child: ChatView(),
      );
    },
  ),
];
