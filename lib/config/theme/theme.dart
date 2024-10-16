import 'package:flutter/material.dart';
import 'package:wac_sports/config/styles/color_palette.dart';

class Themes {
  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(
      background: ColorPalette.primaryColorDark,
      onSecondary: ColorPalette.textColorWhite,
      onTertiary: ColorPalette.textColorGrey,
      error: ColorPalette.errorColor,
    ),
  );
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      background: ColorPalette.primaryColorLight,
      onSecondary: ColorPalette.textColorBlack,
      onTertiary: ColorPalette.textColorGrey,
      error: ColorPalette.errorColor,
    ),
  );
}
