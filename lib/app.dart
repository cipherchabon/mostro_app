import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/providers.dart';
import 'theme.dart';

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
      theme: theme,
      debugShowCheckedModeBanner: false,
    );
  }
}
