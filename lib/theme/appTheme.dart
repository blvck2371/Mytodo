import 'package:flutter/material.dart';
import 'package:mytodo/theme/appColors.dart';
import 'package:mytodo/theme/appTypography.dart';

class Apptheme {
  static final ThemeData LightTheme = ThemeData(
    primaryColor: Appcolors.primaryColorLight,
    colorScheme: ColorScheme.light(
      primary: Appcolors.primaryColorLight,
      secondary: Appcolors.secondaryColorLight,
      surface: Appcolors.surfaceColorLight,
      background: Appcolors.backgroundcolorLight,
      error: Appcolors.errorColor,
    ),
    scaffoldBackgroundColor: Appcolors.backgroundcolorLight,
    appBarTheme: AppBarTheme(
      backgroundColor: Appcolors.backgroundcolorappbarLight,
      elevation: 0,
      iconTheme: IconThemeData(color: Appcolors.textColorlight),
      titleTextStyle: AppTypography.headlineMediumStyle.copyWith(
        color: Appcolors.textColorlight,
      ),
    ),
    iconTheme: IconThemeData(color: Appcolors.textColorlight),
    textTheme: TextTheme(
      displayLarge: AppTypography.displayLargeStyle,
      displayMedium: AppTypography.displayMediumStyle,
      displaySmall: AppTypography.displaySmallStyle,
      headlineLarge: AppTypography.headlineLargeStyle,
      headlineMedium: AppTypography.headlineMediumStyle,
      headlineSmall: AppTypography.headlineSmallStyle,
      titleLarge: AppTypography.titleLargeStyle,
      titleMedium: AppTypography.titleMediumStyle,
      titleSmall: AppTypography.titleSmallStyle,
      bodyLarge: AppTypography.bodyLargeStyle,
      bodyMedium: AppTypography.bodyMediumStyle,
      bodySmall: AppTypography.bodySmallStyle,
      labelLarge: AppTypography.labelLargeStyle,
      labelMedium: AppTypography.labelMediumStyle,
      labelSmall: AppTypography.labelSmallStyle,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Appcolors.primaryColorLight,
        foregroundColor: Colors.white,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: AppTypography.labelLargeStyle,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Appcolors.textColorLightHint),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Appcolors.textColorLightHint),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Appcolors.primaryColorLight),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Appcolors.errorColor),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      labelStyle: AppTypography.labelMediumStyle.copyWith(
        color: Appcolors.textColorLightHint,
      ),
      errorStyle: AppTypography.labelSmallStyle.copyWith(
        color: Appcolors.errorColor,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Appcolors.primaryColorDark,
    colorScheme: ColorScheme.dark(
      primary: Appcolors.primaryColorDark,
      secondary: Appcolors.secondaryColorDark,
      surface: Appcolors.surfaceColorDark,
      background: Appcolors.backgroundcolorDark,
      error: Appcolors.errorColor,
    ),
    scaffoldBackgroundColor: Appcolors.backgroundcolorDark,
    appBarTheme: AppBarTheme(
      backgroundColor: Appcolors.backgroundcolorDark,
      elevation: 0,
      iconTheme: IconThemeData(color: Appcolors.textColorDark),
      titleTextStyle: AppTypography.headlineMediumStyle.copyWith(
        color: Appcolors.textColorDark,
      ),
    ),
    iconTheme: IconThemeData(color: Appcolors.textColorDark),
    textTheme: TextTheme(
      displayLarge: AppTypography.displayLargeStyle.copyWith(
        color: Appcolors.textColorDark,
      ),
      displayMedium: AppTypography.displayMediumStyle.copyWith(
        color: Appcolors.textColorDark,
      ),
      displaySmall: AppTypography.displaySmallStyle.copyWith(
        color: Appcolors.textColorDark,
      ),
      headlineLarge: AppTypography.headlineLargeStyle.copyWith(
        color: Appcolors.textColorDark,
      ),
      headlineMedium: AppTypography.headlineMediumStyle.copyWith(
        color: Appcolors.textColorDark,
      ),
      headlineSmall: AppTypography.headlineSmallStyle.copyWith(
        color: Appcolors.textColorDark,
      ),
      titleLarge: AppTypography.titleLargeStyle.copyWith(
        color: Appcolors.textColorDark,
      ),
      titleMedium: AppTypography.titleMediumStyle.copyWith(
        color: Appcolors.textColorDark,
      ),
      titleSmall: AppTypography.titleSmallStyle.copyWith(
        color: Appcolors.textColorDark,
      ),
      bodyLarge: AppTypography.bodyLargeStyle.copyWith(
        color: Appcolors.textColorDark,
      ),
      bodyMedium: AppTypography.bodyMediumStyle.copyWith(
        color: Appcolors.textColorDark,
      ),
      bodySmall: AppTypography.bodySmallStyle.copyWith(
        color: Appcolors.textColorDark,
      ),
      labelLarge: AppTypography.labelLargeStyle.copyWith(
        color: Appcolors.textColorDark,
      ),
      labelMedium: AppTypography.labelMediumStyle.copyWith(
        color: Appcolors.textColorDark,
      ),
      labelSmall: AppTypography.labelSmallStyle.copyWith(
        color: Appcolors.textColorDark,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Appcolors.primaryColorDark,
        foregroundColor: Appcolors.textColorDark,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: AppTypography.labelLargeStyle,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Appcolors.surfaceColorDark,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Appcolors.textColorDarkSecondary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Appcolors.textColorDarkSecondary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Appcolors.primaryColorDark),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Appcolors.errorColor),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      labelStyle: AppTypography.labelMediumStyle.copyWith(
        color: Appcolors.textColorDarkSecondary,
      ),
      errorStyle: AppTypography.labelSmallStyle.copyWith(
        color: Appcolors.errorColor,
      ),
    ),
  );
}
