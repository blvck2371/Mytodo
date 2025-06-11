import 'package:flutter/material.dart';
import 'package:mytodo/theme/appColors.dart';

class Apptheme {
  static final ThemeData LightTheme = ThemeData(
    primaryColor: Appcolors.primaryColorLight,
    secondaryHeaderColor: Appcolors.secondaryColorLight,
    scaffoldBackgroundColor: Appcolors.backgroundcolorLight,
    primaryColorDark: Appcolors.primaryColorDark,

    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: Appcolors.textColorlight,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.lineThrough,
      ),
      titleLarge: TextStyle(
        color: Appcolors.textColorlight,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: Appcolors.textColorlight,
        fontSize: 12,
        fontWeight: FontWeight.w300,
      ),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Appcolors.backgroundcolorappbarLight,
    ),

    //colorScheme: ColorScheme(brightness: Brightness.light, primary: Appcolors.primaryColorLight, onPrimary: Appcolors.secondaryColorLight, secondary: Appcolors.secondaryColorDark, onSecondary: Appcolors.secondaryColorDark, error: error, onError: onError, surface: surface, onSurface: onSurface)
  );

  static final ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: Appcolors.primaryColorDark),
    primaryColorLight: Appcolors.primaryColorDark,

    primaryColor: Appcolors.primaryColorDark,
    secondaryHeaderColor: Colors.white24,
    scaffoldBackgroundColor: Appcolors.backgroundcolorLight,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: Appcolors.textColorlight,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.lineThrough,
      ),
      titleLarge: TextStyle(
        color: Appcolors.textColorlight,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: Appcolors.textColorlight,
        fontSize: 12,
        fontWeight: FontWeight.w300,
      ),
    ),
    //colorScheme: ColorScheme(brightness: Brightness.light, primary: Appcolors.primaryColorLight, onPrimary: Appcolors.secondaryColorLight, secondary: Appcolors.secondaryColorDark, onSecondary: Appcolors.secondaryColorDark, error: error, onError: onError, surface: surface, onSurface: onSurface)
  );
}
