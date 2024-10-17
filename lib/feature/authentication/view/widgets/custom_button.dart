import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wac_sports/config/styles/color_palette.dart';
import 'package:wac_sports/config/styles/font_palette.dart';
import 'package:wac_sports/core/constants/app_constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    this.isLoading = false,
    this.progress = 0,
    this.onPressed,
  });

  final String buttonText;
  final bool isLoading;
  final double progress;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: AppConstants.borderRadius30,
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          color: ColorPalette.primaryContainer.withOpacity(0.5),
          borderRadius: BorderRadius.circular(30),
        ),
        clipBehavior:
            Clip.hardEdge, // Added to ensure progress bar stays within bounds
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Progress Bar
            if (isLoading)
              Positioned.fill(
                child: AnimatedAlign(
                  alignment: Alignment.centerLeft,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeInOut,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    width: (progress / 100) * MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: ColorPalette.primaryContainer,
                      borderRadius: AppConstants.borderRadius30,
                    ),
                  ),
                ),
              ),

            // Button Text
            Center(
              child: Text(
                isLoading ? "${progress.toInt()}%" : buttonText,
                style: FontPalette.whiteBold.copyWith(fontSize: 17.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
