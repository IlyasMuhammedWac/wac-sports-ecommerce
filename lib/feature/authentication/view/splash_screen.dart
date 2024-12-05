import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wac_sports/config/routes/routes.dart';
import 'package:wac_sports/di.dart';
import 'package:wac_sports/feature/authentication/service/deep_link_service.dart';
import 'package:wac_sports/feature/home/view/widgets/custom_loader.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      if (sl.get<DeepLinkService>().getInitialDeepLink == null) {
        if (FirebaseAuth.instance.currentUser == null) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.login, (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.landingScreen, (route) => false);
        }
      }
    });
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: const Center(
        child: CustomLoader(
          size: Size(50, 50),
        ),
      ),
    );
  }
}
