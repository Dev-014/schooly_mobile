import 'package:flutter/material.dart';

/// Design system colors extracted from Stitch UI
class AppColors {
  // Primary
  static const primary = Color(0xFF006194);
  static const onPrimary = Color(0xFFFFFFFF);
  static const primaryContainer = Color(0xFF007BB9);
  static const onPrimaryContainer = Color(0xFFFDFCFF);
  static const primaryFixed = Color(0xFFCCE5FF);

  // Secondary
  static const secondary = Color(0xFF006E2D);
  static const onSecondary = Color(0xFFFFFFFF);
  static const secondaryContainer = Color(0xFF7CF994);
  static const onSecondaryContainer = Color(0xFF007230);
  static const secondaryFixed = Color(0xFF7FFC97);

  // Tertiary
  static const tertiary = Color(0xFFA33900);
  static const onTertiary = Color(0xFFFFFFFF);
  static const tertiaryContainer = Color(0xFFCC4900);
  static const onTertiaryContainer = Color(0xFFFFFBFF);
  static const tertiaryFixed = Color(0xFFFFDBCE);

  // Error
  static const error = Color(0xFFBA1A1A);
  static const onError = Color(0xFFFFFFFF);
  static const errorContainer = Color(0xFFFFDAD6);
  static const onErrorContainer = Color(0xFF93000A);

  // Surface & Background
  static const background = Color(0xFFFAF8FF);
  static const onBackground = Color(0xFF131B2E);
  static const surface = Color(0xFFFAF8FF);
  static const onSurface = Color(0xFF131B2E);
  static const surfaceVariant = Color(0xFFDAE2FD);
  static const onSurfaceVariant = Color(0xFF3F4850);
  static const inverseSurface = Color(0xFF283044);
  static const inverseOnSurface = Color(0xFFEEF0FF);

  // Surface Containers (Crucial for cards!)
  static const surfaceContainerLowest = Color(0xFFFFFFFF);
  static const surfaceContainerLow = Color(0xFFF2F3FF);
  static const surfaceContainer = Color(0xFFEAEDFF);
  static const surfaceContainerHigh = Color(0xFFE2E7FF);
  static const surfaceContainerHighest = Color(0xFFDAE2FD);

  // Outline
  static const outline = Color(0xFF707881);
  static const outlineVariant = Color(0xFFBFC7D2);

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: onPrimary,
    primaryContainer: primaryContainer,
    onPrimaryContainer: onPrimaryContainer,
    secondary: secondary,
    onSecondary: onSecondary,
    secondaryContainer: secondaryContainer,
    onSecondaryContainer: onSecondaryContainer,
    tertiary: tertiary,
    onTertiary: onTertiary,
    tertiaryContainer: tertiaryContainer,
    onTertiaryContainer: onTertiaryContainer,
    error: error,
    onError: onError,
    errorContainer: errorContainer,
    onErrorContainer: onErrorContainer,
    surface: surface,
    onSurface: onSurface,
    outline: outline,
    outlineVariant: outlineVariant,
    inverseSurface: inverseSurface,
    onInverseSurface: inverseOnSurface,
    inversePrimary: Color(0xFF93CCFF),
    surfaceContainerLowest: surfaceContainerLowest,
    surfaceContainerLow: surfaceContainerLow,
    surfaceContainer: surfaceContainer,
    surfaceContainerHigh: surfaceContainerHigh,
    surfaceContainerHighest: surfaceContainerHighest,
  );
}
