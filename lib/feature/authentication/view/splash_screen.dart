import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wac_sports/config/routes/routes.dart';
import 'package:wac_sports/di.dart';
import 'package:wac_sports/feature/authentication/service/deep_link_service.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      if (sl.get<DeepLinkService>().getInitialDeepLink == null) {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.login, (route) => false);
      }
    });
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
