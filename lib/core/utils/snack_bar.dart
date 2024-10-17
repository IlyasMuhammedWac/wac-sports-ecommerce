import 'package:flutter/material.dart';
import 'package:wac_sports/config/styles/color_palette.dart';
import 'package:wac_sports/config/styles/font_palette.dart';

class SnackBars {
  static showErrorSnackBar(String message, BuildContext context,
      {Color? bgColor}) {
    ScaffoldMessenger.maybeOf(context)
      ?..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        backgroundColor: bgColor ?? ColorPalette.errorColor,
        content: Text(
          message,
          style: FontPalette.whiteMedium,
        ),
      ));
  }
}
