import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wac_sports/config/routes/routes.dart';
import 'package:wac_sports/config/styles/color_palette.dart';
import 'package:wac_sports/config/styles/font_palette.dart';
import 'package:wac_sports/core/constants/app_strings.dart';
import 'package:wac_sports/feature/authentication/view/widgets/auth_input_field.dart';
import 'package:wac_sports/feature/authentication/view/widgets/custom_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              70.verticalSpace,
              _buildLoginHeader(context),
              const AuthInputField(label: AppStrings.userName),
              const AuthInputField(label: AppStrings.email),
              const AuthInputField(label: AppStrings.password),
              10.verticalSpace,
              const CustomButton(buttonText: AppStrings.signUp),
              const Spacer(),
              _buildDonthaveAccountPromt(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginHeader(BuildContext context) {
    return Text(
      "SignUp",
      style: FontPalette.blackBold.copyWith(
        fontSize: 30.sp,
        color: Theme.of(context).colorScheme.onSecondary,
      ),
    );
  }

  Row _buildDonthaveAccountPromt(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account",
            style: FontPalette.blackRegular
                .copyWith(color: Theme.of(context).colorScheme.onSecondary)),
        5.horizontalSpace,
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.login);
          },
          child: Text("Login",
              style: FontPalette.blackRegular
                  .copyWith(color: ColorPalette.primaryContainer)),
        ),
      ],
    );
  }
}
