import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  navigationBarTheme: const NavigationBarThemeData(
    height: 50,
    labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
  ),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFA9C7FF),
  onPrimary: Color(0xFF003063),
  primaryContainer: Color(0xFF00468C),
  onPrimaryContainer: Color(0xFFD6E3FF),
  secondary: Colors.tealAccent,
  onSecondary: Color(0xFF283141),
  secondaryContainer: Color(0xFF3E4758),
  onSecondaryContainer: Color(0xFFDAE2F9),
  tertiary: Color(0xFFDCBCE1),
  onTertiary: Color(0xFF3F2845),
  tertiaryContainer: Color(0xFF563E5C),
  onTertiaryContainer: Color(0xFFF9D8FD),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF1A1B1E),
  onBackground: Color(0xFFE3E2E6),
  surface: Color(0xFF1A1B1E),
  onSurface: Color(0xFFE3E2E6),
  surfaceVariant: Color(0xFF44474E),
  onSurfaceVariant: Color(0xFFC4C6CF),
  outline: Color(0xFF8E9099),
  onInverseSurface: Color(0xFF1A1B1E),
  inverseSurface: Color(0xFFE3E2E6),
  inversePrimary: Color(0xFF005DB7),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFA9C7FF),
  outlineVariant: Color(0xFF44474E),
  scrim: Color(0xFF000000),
);
