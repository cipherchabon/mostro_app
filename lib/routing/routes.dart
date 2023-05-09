enum AppRoute {
  auth('/auth'),
  home('/home'),
  orders('/orders'),
  orderDetail('order-detail'),
  chat('/chat'),
  notifications('/notifications');

  const AppRoute(this.path);

  final String path;
}
