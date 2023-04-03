import 'dart:async';

import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    runApp(const MostroApp());
  }, (error, stack) {
    debugPrint('Error: $error');
  });
}
