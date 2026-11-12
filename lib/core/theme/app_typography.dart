import 'package:flutter/material.dart';

class AppTypography {
  static const String headlineFont = 'Plus Jakarta Sans';
  static const String bodyFont = 'Plus Jakarta Sans';

  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: headlineFont,
      fontWeight: FontWeight.w800,
      fontSize: 57,
    ),
    displayMedium: TextStyle(
      fontFamily: headlineFont,
      fontWeight: FontWeight.w800,
      fontSize: 45,
    ),
    displaySmall: TextStyle(
      fontFamily: headlineFont,
      fontWeight: FontWeight.w700,
      fontSize: 36,
    ),
    headlineLarge: TextStyle(
      fontFamily: headlineFont,
      fontWeight: FontWeight.w700,
      fontSize: 32,
    ),
    headlineMedium: TextStyle(
      fontFamily: headlineFont,
      fontWeight: FontWeight.w700,
      fontSize: 28,
    ),
    headlineSmall: TextStyle(
      fontFamily: headlineFont,
      fontWeight: FontWeight.w600,
      fontSize: 24,
    ),
    titleLarge: TextStyle(
      fontFamily: headlineFont,
      fontWeight: FontWeight.w600,
      fontSize: 22,
    ),
    titleMedium: TextStyle(
      fontFamily: headlineFont,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
    titleSmall: TextStyle(
      fontFamily: headlineFont,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
    bodyLarge: TextStyle(
      fontFamily: bodyFont,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      fontFamily: bodyFont,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    bodySmall: TextStyle(
      fontFamily: bodyFont,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    labelLarge: TextStyle(
      fontFamily: bodyFont,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
    labelMedium: TextStyle(
      fontFamily: bodyFont,
      fontWeight: FontWeight.w500,
      fontSize: 12,
    ),
    labelSmall: TextStyle(
      fontFamily: bodyFont,
      fontWeight: FontWeight.w500,
      fontSize: 11,
    ),
  );
}
