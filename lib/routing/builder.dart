import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/auth/view/auth_view.dart';
import '../screens/chat/chat_view.dart';
import '../screens/home/home_view.dart';
import '../screens/notifications/notifications_view.dart';
import '../screens/orders/order_detail_view.dart';
import '../screens/orders/orders_view.dart';
import 'routes.dart';
import 'shell_scaffold.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

class RouterBuilder {
  const RouterBuilder();

  GoRouter build() => GoRouter(
        navigatorKey: _rootNavigatorKey,
        initialLocation: AppRoute.auth.path,
        redirect: (context, state) {
          return null;
        },
        routes: [
          ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) => ShellScaffold(
              child: child,
            ),
            routes: [
              GoRoute(
                path: AppRoute.home.path,
                name: AppRoute.home.name,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: HomeView(),
                  );
                },
              ),
              GoRoute(
                  path: AppRoute.orders.path,
                  name: AppRoute.orders.name,
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(
                      child: OrdersView(),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: AppRoute.orderDetail.path,
                      name: AppRoute.orderDetail.name,
                      builder: (context, state) => const OrderDetailView(),
                    ),
                  ]),
              GoRoute(
                path: AppRoute.chat.path,
                name: AppRoute.chat.name,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: ChatView(),
                  );
                },
              ),
              GoRoute(
                path: AppRoute.notifications.path,
                name: AppRoute.notifications.name,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: NotificationsView(),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: AppRoute.auth.path,
            name: AppRoute.auth.name,
            builder: (context, state) => const AuthScreen(),
          ),
        ],
      );
}
