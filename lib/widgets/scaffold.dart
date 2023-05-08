import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  const CustomScaffold({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: logoColor,
            statusBarIconBrightness: Brightness.light,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: body,
          ),
        ),
      );
}
