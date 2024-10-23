import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:wac_sports/config/routes/route_generator.dart';
import 'package:wac_sports/config/routes/routes.dart';

class DeepLinkService {
  final FirebaseDynamicLinks _dynamicLinks;
  Uri? _deepLinkIsActive;
  DeepLinkService(this._dynamicLinks);

  Future<void> initDynamicLinks() async {
    final response = await _dynamicLinks.getInitialLink();
    _deepLinkIsActive = response?.link;
    final dyanamicLinkData = response?.link;
    if (dyanamicLinkData != null) {
      final String? mode = dyanamicLinkData.queryParameters['mode'];
      final String? oobCode = dyanamicLinkData.queryParameters['oobCode'];
      if (mode == 'resetPassword' && oobCode != null) {
        handleDeepLink(oobCode);
      }
    }
    _dynamicLinks.onLink.listen((PendingDynamicLinkData? event) {
      final Uri? deepLink = event?.link;
      if (deepLink != null) {
        final String? mode = deepLink.queryParameters['mode'];
        final String? oobCode = deepLink.queryParameters['oobCode'];
        if (mode == 'resetPassword' && oobCode != null) {
          handleDeepLink(oobCode);
        }
      }
    });
  }

  Uri? get getInitialDeepLink => _deepLinkIsActive;

  void handleDeepLink(String code) {
    final context = RouteGenerator.navigatorKey.currentContext;

    if (context != null) {
      debugPrint('Navigating to reset password with code: $code');
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.resetPassword, (route) => false,
          arguments: code);
    } else {
      debugPrint('Navigation failed: Context is null');
    }
  }
}
