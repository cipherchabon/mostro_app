import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      icon: Icon(Icons.search),
      selectedIcon: Icon(Icons.search_outlined),
      label: 'Search',
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
    NavigationDestination(
      icon: Icon(Icons.account_circle),
      selectedIcon: Icon(Icons.account_circle_outlined),
      label: 'Profile',
    ),
  ];

  void _onDestinationSelected(int index) {
    switch (index) {
      case 1:
        context.goNamed(AppRoute.search.name);
        break;
      case 2:
        context.goNamed(AppRoute.chat.name);
        break;
      case 3:
        context.goNamed(AppRoute.notifications.name);
        break;
      case 4:
        context.goNamed(AppRoute.profile.name);
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
      case AppRoute.search:
        return 1;
      case AppRoute.chat:
        return 2;
      case AppRoute.notifications:
        return 3;
      case AppRoute.profile:
        return 4;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: _onDestinationSelected,
        destinations: _destinations,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
