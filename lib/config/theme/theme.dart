import 'package:flutter/material.dart';
import 'package:wac_sports/config/styles/color_palette.dart';

class Themes {
  static final darkTheme = ThemeData(
     
    scaffoldBackgroundColor: ColorPalette.primaryColorDark,
    appBarTheme: AppBarTheme(backgroundColor: ColorPalette.primaryColorDark),
    colorScheme: ColorScheme.dark(
      
      surface: ColorPalette.primaryColorDark,
      onSecondary: ColorPalette.textColorWhite,
      onTertiary: ColorPalette.textColorGrey,
      error: ColorPalette.errorColor,
    ),
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorPalette.primaryColorLight,
    appBarTheme: AppBarTheme(backgroundColor: ColorPalette.primaryColorLight),
    colorScheme: ColorScheme.light(
      surface: ColorPalette.primaryColorLight,
      onSecondary: ColorPalette.textColorBlack,
      onTertiary: ColorPalette.textColorGrey,
      error: ColorPalette.errorColor,
    ),
  );
}
