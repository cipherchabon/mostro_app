import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/app/view/app.dart';

void main() async {
  /// Catch errors caught by Flutter
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    debugPrint('Error: ${details.exception}');
    if (kReleaseMode) exit(1);
  };

  /// Catch errors not caught by Flutter
  PlatformDispatcher.instance.onError = (exception, stackTrace) {
    debugPrint('Error: $exception');
    return true;
  };

  /// Ensures that Flutter is properly initialized;
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: MostroApp(),
    ),
  );
}
