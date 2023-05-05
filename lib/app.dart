import 'package:flutter/material.dart';
import 'routing.dart';
import 'theme.dart';

class MostroApp extends StatelessWidget {
  const MostroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mostro App',
      routerConfig: router,
      theme: theme,
      debugShowCheckedModeBanner: false,
    );
  }
}
