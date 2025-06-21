import 'package:flutter/material.dart';

class AppTypography {
  // Familles de polices
  static const String primaryFont = 'Poppins';
  static const String secondaryFont = 'Roboto';

  // Tailles de police
  static const double displayLarge = 32.0;
  static const double displayMedium = 28.0;
  static const double displaySmall = 24.0;

  static const double headlineLarge = 22.0;
  static const double headlineMedium = 20.0;
  static const double headlineSmall = 18.0;

  static const double titleLarge = 16.0;
  static const double titleMedium = 14.0;
  static const double titleSmall = 12.0;

  static const double bodyLarge = 16.0;
  static const double bodyMedium = 14.0;
  static const double bodySmall = 12.0;

  static const double labelLarge = 14.0;
  static const double labelMedium = 12.0;
  static const double labelSmall = 10.0;

  // Styles de texte
  static TextStyle displayLargeStyle = const TextStyle(
    fontFamily: primaryFont,
    fontSize: displayLarge,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );

  static TextStyle displayMediumStyle = const TextStyle(
    fontFamily: primaryFont,
    fontSize: displayMedium,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );

  static TextStyle displaySmallStyle = const TextStyle(
    fontFamily: primaryFont,
    fontSize: displaySmall,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.25,
  );

  static TextStyle headlineLargeStyle = const TextStyle(
    fontFamily: primaryFont,
    fontSize: headlineLarge,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.25,
  );

  static TextStyle headlineMediumStyle = const TextStyle(
    fontFamily: primaryFont,
    fontSize: headlineMedium,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.25,
  );

  static TextStyle headlineSmallStyle = const TextStyle(
    fontFamily: primaryFont,
    fontSize: headlineSmall,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.25,
  );

  static TextStyle titleLargeStyle = const TextStyle(
    fontFamily: primaryFont,
    fontSize: titleLarge,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
  );

  static TextStyle titleMediumStyle = const TextStyle(
    fontFamily: primaryFont,
    fontSize: titleMedium,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
  );

  static TextStyle titleSmallStyle = const TextStyle(
    fontFamily: primaryFont,
    fontSize: titleSmall,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
  );

  static TextStyle bodyLargeStyle = const TextStyle(
    fontFamily: secondaryFont,
    fontSize: bodyLarge,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.15,
  );

  static TextStyle bodyMediumStyle = const TextStyle(
    fontFamily: secondaryFont,
    fontSize: bodyMedium,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.15,
  );

  static TextStyle bodySmallStyle = const TextStyle(
    fontFamily: secondaryFont,
    fontSize: bodySmall,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.15,
  );

  static TextStyle labelLargeStyle = const TextStyle(
    fontFamily: secondaryFont,
    fontSize: labelLarge,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  static TextStyle labelMediumStyle = const TextStyle(
    fontFamily: secondaryFont,
    fontSize: labelMedium,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  static TextStyle labelSmallStyle = const TextStyle(
    fontFamily: secondaryFont,
    fontSize: labelSmall,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  // Méthode pour obtenir un style avec une couleur spécifique
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }
} 