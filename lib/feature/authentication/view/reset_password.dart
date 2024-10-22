import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:wac_sports/config/routes/routes.dart';
import 'package:wac_sports/config/styles/color_palette.dart';
import 'package:wac_sports/config/styles/font_palette.dart';
import 'package:wac_sports/core/utils/snack_bar.dart';
import 'package:wac_sports/core/utils/validators.dart';
import 'package:wac_sports/di.dart';
import 'package:wac_sports/feature/authentication/view/widgets/auth_input_field.dart';
import 'package:wac_sports/feature/authentication/view/widgets/custom_button.dart';
import 'package:wac_sports/feature/authentication/view_model/auth_view_model.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key, required this.code});
  final String code;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late GlobalKey<FormState> _formKey;
  @override
  void initState() {
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl.get<AuthViewModel>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Create a new password"),
          elevation: 0,
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.login);
                },
                child: Text(
                  "Skip to login",
                  style: FontPalette.whiteRegular.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 12.sp),
                ))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(15.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  "Ensure your new password is different from previous ones for added security.",
                  style: FontPalette.whiteMedium.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
                10.verticalSpace,
                AuthInputField(
                    label: "New password",
                    controller: _passwordController,
                    validator: Validators.passwordValidator),
                AuthInputField(
                    label: "Confirm new password",
                    controller: _confirmPasswordController,
                    validator: (value) => Validators.confirmPasswordValidator(
                        value, _passwordController.text.trim())),
                10.verticalSpace,
                Selector<AuthViewModel, Tuple2<LoadState, double>>(
                    selector: (p0, p1) =>
                        Tuple2(p1.buttonLoadState, p1.progress),
                    builder: (context, value, _) {
                      return CustomButton(
                        isLoading: value.item1 == LoadState.loading,
                        buttonText: "Update password",
                        progress: value.item2,
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            final newPassword = _passwordController.text.trim();
                            context.read<AuthViewModel>().updatePassword(
                                  code: widget.code,
                                  newPassword: newPassword,
                                  onError: (error) {
                                    SnackBars.showErrorSnackBar(error, context);
                                  },
                                  onSuccess: (success) {
                                    Navigator.pushReplacementNamed(
                                        context, Routes.login);
                                    SnackBars.showErrorSnackBar(
                                        success, context,
                                        bgColor: ColorPalette.textColorGrey);
                                  },
                                );
                          }
                        },
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
