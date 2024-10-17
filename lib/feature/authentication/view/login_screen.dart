import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:wac_sports/config/routes/routes.dart';
import 'package:wac_sports/config/styles/color_palette.dart';
import 'package:wac_sports/config/styles/font_palette.dart';
import 'package:wac_sports/core/constants/app_strings.dart';
import 'package:wac_sports/core/utils/snack_bar.dart';
import 'package:wac_sports/core/utils/validators.dart';
import 'package:wac_sports/feature/authentication/model/auth_input_model.dart';
import 'package:wac_sports/feature/authentication/service/auth_service.dart';
import 'package:wac_sports/feature/authentication/view/widgets/auth_input_field.dart';
import 'package:wac_sports/feature/authentication/view/widgets/custom_button.dart';
import 'package:wac_sports/feature/authentication/view_model/auth_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;
  initializeControllers() {
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController(text: "ilyas@gmail.com");
    _passwordController = TextEditingController(text: "123456");
  }

  @override
  void initState() {
    initializeControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: AuthViewModel(
          authRepository:
              AuthService(FirebaseAuth.instance, FirebaseFirestore.instance)),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  70.verticalSpace,
                  _buildLoginHeader(context),
                  15.verticalSpace,
                  AuthInputField(
                    label: AppStrings.email,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.emailValidator,
                  ),
                  AuthInputField(
                    label: AppStrings.password,
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    validator: Validators.passwordValidator,
                  ),
                  _buildForgotPasswordButton(context),
                  Selector<AuthViewModel, Tuple2<LoadState, double>>(
                      selector: (p0, p1) =>
                          Tuple2(p1.buttonLoadState, p1.progress),
                      builder: (context, state, _) {
                        return CustomButton(
                          buttonText: AppStrings.login,
                          isLoading: state.item1 == LoadState.loading,
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              context
                                  .read<AuthViewModel>()
                                  .loginWithEmailAndPassword(
                                AuthInputModel(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                ),
                                onError: (message) {
                                  SnackBars.showErrorSnackBar(message, context);
                                },
                                onSuccess: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, Routes.landingScreen, (route) => false);
                                },
                              );
                            }
                          },
                          progress: state.item2,
                        );
                      }),
                  const Spacer(),
                  _buildDonthaveAccountPromt(context),
                  10.verticalSpace,
                ],
              ),
            ),
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
