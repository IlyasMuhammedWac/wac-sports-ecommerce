import 'package:flutter/material.dart';
import 'package:wac_sports/config/styles/color_palette.dart';

class Themes {
  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(
      background: ColorPalette.primaryColorDark,
      onSecondary: ColorPalette.textColorWhite,
    ),
  );
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      background: ColorPalette.primaryColorDark,
      onSecondary: ColorPalette.textColorBlack,
    ),
  );
}
