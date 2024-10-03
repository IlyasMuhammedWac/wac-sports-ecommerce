import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontPalette {
  static TextStyle get blackBold => TextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.w700, color: Colors.black);

  static TextStyle get blackMedium => TextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.black);

  static TextStyle get blackRegular => TextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black);

  static TextStyle get whiteBold => TextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.w700, color: Colors.white);

  static TextStyle get whiteMedium => TextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.white);

  static TextStyle get whiteRegular => TextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.white);

  static TextStyle get greenBold => TextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.w700, color: Colors.green);
}
