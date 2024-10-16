import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wac_sports/config/routes/routes.dart';
import 'package:wac_sports/config/styles/color_palette.dart';
import 'package:wac_sports/config/styles/font_palette.dart';
import 'package:wac_sports/core/constants/app_strings.dart';
import 'package:wac_sports/feature/authentication/view/widgets/auth_input_field.dart';
import 'package:wac_sports/feature/authentication/view/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              70.verticalSpace,
              _buildLoginHeader(context),
              15.verticalSpace,
              const AuthInputField(label: AppStrings.email),
              const AuthInputField(label: AppStrings.password),
              _buildForgotPasswordButton(context),
              const CustomButton(buttonText: AppStrings.login),
              const Spacer(),
              _buildDonthaveAccountPromt(context),
              10.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Row _buildDonthaveAccountPromt(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppStrings.dontHaveAcc,
            style: FontPalette.blackRegular
                .copyWith(color: Theme.of(context).colorScheme.onSecondary)),
        5.horizontalSpace,
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.signup);
          },
          child: Text(AppStrings.regNow,
              style: FontPalette.blackRegular
                  .copyWith(color: ColorPalette.primaryContainer)),
        ),
      ],
    );
  }

  Widget _buildLoginHeader(BuildContext context) {
    return Text(
      AppStrings.login,
      style: FontPalette.blackBold.copyWith(
        fontSize: 30.sp,
        color: Theme.of(context).colorScheme.onSecondary,
      ),
    );
  }

  Widget _buildForgotPasswordButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.forgotPassword);
        },
        child: Text(AppStrings.forgotPass,
            style: FontPalette.whiteRegular
                .copyWith(color: Theme.of(context).colorScheme.onSecondary)),
      ),
    );
  }
}
