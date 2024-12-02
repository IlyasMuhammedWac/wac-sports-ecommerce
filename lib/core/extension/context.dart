import 'package:flutter/material.dart';
import 'package:wac_sports/config/styles/color_palette.dart';

extension CustomContext on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => theme.colorScheme;

  Color get primaryColor => ColorPalette.primaryContainer;
  Color get textColor => colors.onSecondary;
  Color get green => ColorPalette.greenColor;
}
/**
path.lineTo(w, h * 0.65);

    path.quadraticBezierTo(w * 0.98, h * 0.7, w * 0.92, h * 0.72);

    path.quadraticBezierTo(w * 0.87, h * 0.72, w * 0.8, h * 0.83);

    path.quadraticBezierTo(w * 0.78, h * 0.95, w * 0.65, h * 0.99);

    path.lineTo(0, h);

    path.close();
 */