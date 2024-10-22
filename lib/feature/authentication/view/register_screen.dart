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
import 'package:wac_sports/di.dart';
import 'package:wac_sports/feature/authentication/model/auth_input_model.dart';
import 'package:wac_sports/feature/authentication/view/widgets/auth_input_field.dart';
import 'package:wac_sports/feature/authentication/view/widgets/custom_button.dart';
import 'package:wac_sports/feature/authentication/view_model/auth_view_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  initializeControllers() {
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController(text: "ilyas@gmail.com");
    _passwordController = TextEditingController(text: "123456");
    _usernameController = TextEditingController();
  }

  @override
  void initState() {
    initializeControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl.get<AuthViewModel>(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  70.verticalSpace,
                  _buildLoginHeader(context),
                  AuthInputField(
                    label: AppStrings.userName,
                    controller: _usernameController,
                    validator: Validators.usernameValidator,
                  ),
                  AuthInputField(
                    controller: _emailController,
                    label: AppStrings.email,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.emailValidator,
                  ),
                  AuthInputField(
                    controller: _passwordController,
                    label: AppStrings.password,
                    keyboardType: TextInputType.visiblePassword,
                    validator: Validators.passwordValidator,
                  ),
                  10.verticalSpace,
                  Selector<AuthViewModel, Tuple2<LoadState, double>>(
                      selector: (p0, p1) =>
                          Tuple2(p1.buttonLoadState, p1.progress),
                      builder: (context, value, _) {
                        return CustomButton(
                          buttonText: AppStrings.signUp,
                          isLoading: value.item1 == LoadState.loading,
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              context
                                  .read<AuthViewModel>()
                                  .signUpWithEmailAndPassword(
                                    AuthInputModel(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text.trim(),
                                      username: _usernameController.text.trim(),
                                    ),
                                    onSuccess: _onSuccess(context),
                                    onError: (error) =>
                                        _onError(context, error),
                                  );
                            }
                          },
                          progress: value.item2,
                        );
                      }),
                  const Spacer(),
                  _buildDonthaveAccountPromt(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onSuccess(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, Routes.landingScreen, (route) => false);
  }

  _onError(BuildContext context, String message) {
    SnackBars.showErrorSnackBar(message, context);
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
