import 'package:go_router/go_router.dart';

import 'order_detail_view.dart';
import 'orders_view.dart';

const ordersRoutePath = '/orders';
const orderDetailRoutePath = 'order-detail';

final ordersRoutes = [
  GoRoute(
    path: ordersRoutePath,
    pageBuilder: (context, state) {
      return const NoTransitionPage(
        child: OrdersView(),
      );
    },
    routes: [
      GoRoute(
        path: orderDetailRoutePath,
        builder: (context, state) => const OrderDetailView(),
      ),
    ],
  ),
];
