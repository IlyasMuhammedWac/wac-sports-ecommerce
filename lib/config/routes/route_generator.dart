import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wac_sports/config/routes/routes.dart';
import 'package:wac_sports/feature/authentication/view/forget_password.dart';
import 'package:wac_sports/feature/authentication/view/login_screen.dart';
import 'package:wac_sports/feature/authentication/view/register_screen.dart';
import 'package:wac_sports/feature/authentication/view/splash_screen.dart';
import 'package:wac_sports/feature/home/view/landing_screen.dart';

class RouteGenerator {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return _buildRoute(Routes.splash, const SplashScreen());
      case Routes.login:
        return _buildRoute(Routes.login, const LoginScreen(),
            cupertinoPageRoute: true);
      case Routes.signup:
        return _buildRoute(Routes.signup, const RegisterScreen(),
            cupertinoPageRoute: true);
      case Routes.forgotPassword:
        return _buildRoute(Routes.forgotPassword, const ForgotPasswordScreen(),
            cupertinoPageRoute: true);
      case Routes.landingScreen:
        return _buildRoute(Routes.landingScreen, const LandingScreen(),
            cupertinoPageRoute: true);
      default:
        return _buildRoute('/', const SizedBox());
    }
  }

  static Route _buildRoute(String route, Widget widget,
      {bool cupertinoPageRoute = false}) {
    return cupertinoPageRoute
        ? CupertinoPageRoute(
            settings: RouteSettings(name: route),
            builder: (_) => widget,
          )
        : MaterialPageRoute(
            settings: RouteSettings(name: route),
            builder: (_) => widget,
          );
  }
}
