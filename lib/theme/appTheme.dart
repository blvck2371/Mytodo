import 'package:flutter/material.dart';
import 'package:mytodo/theme/appColors.dart';

class Apptheme {
  static final ThemeData LightTheme = ThemeData(
    primaryColor: const Color.fromARGB(255, 37, 207, 139),
    secondaryHeaderColor: Appcolors.secondaryColorLight,
    scaffoldBackgroundColor: Appcolors.backgroundcolorLight,
    textTheme: TextTheme(
      titleLarge: TextStyle(color: Appcolors.textColorlight),
    ),

    appBarTheme: AppBarTheme(backgroundColor: Appcolors.secondaryColorLight),

    //colorScheme: ColorScheme(brightness: Brightness.light, primary: Appcolors.primaryColorLight, onPrimary: Appcolors.secondaryColorLight, secondary: Appcolors.secondaryColorDark, onSecondary: Appcolors.secondaryColorDark, error: error, onError: onError, surface: surface, onSurface: onSurface)
  );

  static final ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: Appcolors.primaryColorDark),
    primaryColor: Appcolors.primaryColorDark,
    secondaryHeaderColor: Appcolors.secondaryColorLight,
    scaffoldBackgroundColor: Appcolors.backgroundcolorLight,
    textTheme: TextTheme(
      titleLarge: TextStyle(color: Appcolors.textColorlight),
    ),

    //colorScheme: ColorScheme(brightness: Brightness.light, primary: Appcolors.primaryColorLight, onPrimary: Appcolors.secondaryColorLight, secondary: Appcolors.secondaryColorDark, onSecondary: Appcolors.secondaryColorDark, error: error, onError: onError, surface: surface, onSurface: onSurface)
  );
}
