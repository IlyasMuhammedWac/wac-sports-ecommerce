import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wac_sports/config/routes/routes.dart';

class RouteGenerator {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return _buildRoute(Routes.splash, const SizedBox());
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
