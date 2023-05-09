import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/providers.dart';
import 'theme/color_schemes.dart';

class MostroApp extends ConsumerStatefulWidget {
  const MostroApp({super.key});

  @override
  ConsumerState<MostroApp> createState() => _MostroAppState();
}

class _MostroAppState extends ConsumerState<MostroApp> {
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Mostro App',
      routerConfig: router,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
