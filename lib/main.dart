import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wac_sports/config/routes/route_generator.dart';
import 'package:wac_sports/config/routes/routes.dart';
import 'package:wac_sports/config/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wac_sports/di.dart';
import 'package:wac_sports/feature/authentication/service/deep_link_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  await setupDependencyIndejection();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    sl.get<DeepLinkService>().initDynamicLinks();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Wac sports',
        initialRoute: Routes.splash,
        onGenerateRoute: RouteGenerator.generateRoute,
        navigatorKey: RouteGenerator.navigatorKey,
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        themeMode: ThemeMode.system,
      ),
    );
  }
}
