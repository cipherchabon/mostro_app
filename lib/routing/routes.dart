enum AppRoute {
  auth('/auth'),
  home('/home'),
  search('/search'),
  orderDetail('order-detail'),
  chat('/chat'),
  notifications('/notifications'),
  profile('/profile');

  const AppRoute(this.path);

  final String path;
}
