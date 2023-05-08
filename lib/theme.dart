import 'package:flutter/material.dart';

const primaryColor = Color(0xFF673AB7);
const secondaryColor = Color(0xFFFFFFFF);
const accentColor = Color(0xFFFF9900);
const primaryColorLight = Color(0xFFD1C4E9);
const primaryColorDark = Color(0xFF512DA8);
const accentColorContrast = Color(0xFF212121);
const logoColor = Color(0xFF8CC63F);
const backgroundColor = Color(0xFFF5F5F5);

final theme = ThemeData.from(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
  ),
);

final darkTheme = ThemeData.dark().copyWith(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: logoColor,
  ),
);

const subHeaderTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
  fontSize: 20,
  height: 1.1947,
);

const titleTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400,
  fontSize: 22,
  height: 1.0861,
);

const quoteTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400,
  fontSize: 16,
  height: 1.4933,
);

const largeBodyTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400,
  fontSize: 14,
  height: 1.7067,
);

const buttonTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
  fontSize: 14,
  height: 1.7067,
);

final filledButtonStyle = FilledButton.styleFrom(
  padding: const EdgeInsets.symmetric(
    horizontal: 36,
  ),
);

final underlineTextButtonStyle = TextButton.styleFrom(
  padding: const EdgeInsets.symmetric(
    horizontal: 36,
  ),
  textStyle: const TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    decoration: TextDecoration.underline,
  ),
);
