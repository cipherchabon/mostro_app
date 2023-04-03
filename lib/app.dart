import 'package:flutter/material.dart';
import 'package:mostro_app/routing.dart';

class MostroApp extends StatelessWidget {
  const MostroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mostro App',
      routerConfig: router,
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}
