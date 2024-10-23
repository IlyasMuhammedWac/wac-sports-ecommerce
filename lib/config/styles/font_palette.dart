import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FontPalette {
  static TextStyle get blackBold => GoogleFonts.montserrat(
      fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.black);

  static TextStyle get blackMedium => GoogleFonts.montserrat(
      fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.black);

  static TextStyle get blackRegular => GoogleFonts.montserrat(
      fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black);

  static TextStyle get whiteBold => GoogleFonts.montserrat(
      fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.white);

  static TextStyle get whiteMedium => GoogleFonts.montserrat(
      fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.white);

  static TextStyle get whiteRegular => GoogleFonts.montserrat(
      fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.white);

  static TextStyle get greenBold => GoogleFonts.montserrat(
      fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.green);
}
