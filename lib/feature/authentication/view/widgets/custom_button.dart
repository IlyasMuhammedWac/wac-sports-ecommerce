import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wac_sports/config/styles/color_palette.dart';
import 'package:wac_sports/config/styles/font_palette.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
  });
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll(ColorPalette.primaryContainer),
          fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 50.h))),
      child: Text(
        buttonText,
        style: FontPalette.whiteBold.copyWith(fontSize: 17.sp),
      ),
    );
  }
}
