import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:wac_sports/config/styles/color_palette.dart';
import 'package:wac_sports/config/styles/font_palette.dart';
import 'package:wac_sports/core/constants/app_strings.dart';
import 'package:wac_sports/core/utils/snack_bar.dart';
import 'package:wac_sports/core/utils/validators.dart';
import 'package:wac_sports/di.dart';
import 'package:wac_sports/feature/authentication/view/widgets/auth_input_field.dart';
import 'package:wac_sports/feature/authentication/view/widgets/custom_button.dart';
import 'package:wac_sports/feature/authentication/view_model/auth_view_model.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController _emailController;
  late GlobalKey<FormState> _formKey;
  @override
  void initState() {
    _emailController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl.get<AuthViewModel>(),
      child: Scaffold(
        appBar: AppBar(elevation: 0),
        body: Padding(
          padding: EdgeInsets.all(14.w),
          child: Form(
            key: _formKey,
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
                AuthInputField(
                    label: AppStrings.email,
                    controller: _emailController,
                    validator: Validators.emailValidator),
                10.verticalSpace,
                Selector<AuthViewModel, Tuple2<LoadState, double>>(
                    selector: (p0, p1) =>
                        Tuple2(p1.buttonLoadState, p1.progress),
                    builder: (context, value, child) {
                      return CustomButton(
                        buttonText: AppStrings.send,
                        progress: value.item2,
                        isLoading: value.item1 == LoadState.loading,
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            final email = _emailController.text.trim();
                            context.read<AuthViewModel>().forgotPassword(
                              email,
                              onError: (error) {
                                SnackBars.showErrorSnackBar(error, context);
                              },
                              onSuccess: (success) {
                                SnackBars.showErrorSnackBar(success, context,
                                    bgColor: ColorPalette.textColorGrey);
                                _emailController.clear();
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
