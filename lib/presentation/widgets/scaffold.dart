import 'package:flutter/material.dart' hide Scaffold;
import 'package:flutter/material.dart' as m show Scaffold;
import 'package:flutter/services.dart';

// final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class Scaffold extends StatelessWidget {
  final AppBar? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;

  const Scaffold({
    super.key,
    this.appBar,
    required this.body,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) => m.Scaffold(
        appBar: appBar,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).colorScheme.primary,
            statusBarIconBrightness: Brightness.light,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: body,
          ),
        ),
        bottomNavigationBar: bottomNavigationBar,
      );
}
