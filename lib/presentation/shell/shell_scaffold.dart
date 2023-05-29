import '../chat/chat.dart';
import '../home/home.dart';
import '../notifications/notifications.dart';
import '../orders/orders.dart';
import '../widgets/widgets.dart';

class ShellScaffold extends StatefulWidget {
  final Widget child;

  const ShellScaffold({
    super.key,
    required this.child,
  });

  @override
  State<ShellScaffold> createState() => _ShellScaffoldState();
}

class _ShellScaffoldState extends State<ShellScaffold> {
  static const _destinations = <NavigationDestination>[
    NavigationDestination(
      icon: Icon(Icons.home),
      selectedIcon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(Icons.list_alt),
      selectedIcon: Icon(Icons.list_alt_outlined),
      label: 'Orders',
    ),
    NavigationDestination(
      icon: Icon(Icons.chat),
      selectedIcon: Icon(Icons.chat_outlined),
      label: 'Chat',
    ),
    NavigationDestination(
      icon: Icon(Icons.notifications),
      selectedIcon: Icon(Icons.notifications_outlined),
      label: 'Notifications',
    ),
  ];

  void _onDestinationSelected(int index) {
    final path = switch (index) {
      1 => ordersRoutePath,
      2 => chatRoutePath,
      3 => notificationsRoutePath,
      _ => homeRoutePath,
    };
    context.go(path);
  }

  int get _selectedIndex {
    final path = GoRouter.of(context).location;
    return switch (path) {
      ordersRoutePath => 1,
      chatRoutePath => 2,
      notificationsRoutePath => 3,
      _ => 0,
    };
  }

  String get title {
    final path = GoRouter.of(context).location;
    return switch (path) {
      homeRoutePath => 'Mostro',
      ordersRoutePath => 'Orders',
      chatRoutePath => 'Chat',
      notificationsRoutePath => 'Notifications',
      _ => '',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
        actions: [
          SvgIconButton(
            hubIcon,
            onPressed: () {},
          ),
          SvgIconButton(
            accountCircleIcon,
            onPressed: () {},
          ),
        ],
      ),
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: _onDestinationSelected,
        destinations: _destinations,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
