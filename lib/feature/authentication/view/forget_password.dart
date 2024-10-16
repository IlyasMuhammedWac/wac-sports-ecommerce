import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wac_sports/config/styles/font_palette.dart';
import 'package:wac_sports/core/constants/app_strings.dart';
import 'package:wac_sports/feature/authentication/view/widgets/auth_input_field.dart';
import 'package:wac_sports/feature/authentication/view/widgets/custom_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: Padding(
        padding: EdgeInsets.all(14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.forgotPass,
              style: FontPalette.blackBold.copyWith(
                  fontSize: 30.sp,
                  color: Theme.of(context).colorScheme.onSecondary),
            ),
            50.verticalSpace,
            const Text(AppStrings.forgotPassContent),
            10.verticalSpace,
            const AuthInputField(label: AppStrings.email),
            10.verticalSpace,
            const CustomButton(buttonText: AppStrings.send)
          ],
        ),
      ),
    );
  }
}
