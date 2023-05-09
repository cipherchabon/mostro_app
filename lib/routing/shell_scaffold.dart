import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mostro_app/asset_paths/icon_paths.dart';

import '../widgets/svg_icon_button.dart';
import 'routes.dart';

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
    switch (index) {
      case 1:
        context.goNamed(AppRoute.orders.name);
        break;
      case 2:
        context.goNamed(AppRoute.chat.name);
        break;
      case 3:
        context.goNamed(AppRoute.notifications.name);
        break;
      default:
        context.goNamed(AppRoute.home.name);
    }
  }

  int get _selectedIndex {
    final location = GoRouter.of(context).location;
    final route = AppRoute.values.firstWhere(
      (route) => route.path == location,
      orElse: () => AppRoute.home,
    );
    switch (route) {
      case AppRoute.orders:
        return 1;
      case AppRoute.chat:
        return 2;
      case AppRoute.notifications:
        return 3;
      default:
        return 0;
    }
  }

  String get title {
    final location = GoRouter.of(context).location;
    final route = AppRoute.values.firstWhere(
      (route) => route.path == location,
      orElse: () => AppRoute.home,
    );
    switch (route) {
      case AppRoute.home:
        return 'Mostro';
      case AppRoute.orders:
        return 'Orders';
      case AppRoute.chat:
        return 'Chat';
      case AppRoute.notifications:
        return 'Notifications';
      default:
        return '';
    }
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
