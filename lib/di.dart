import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get_it/get_it.dart';
import 'package:wac_sports/feature/authentication/repo/auth_repo.dart';
import 'package:wac_sports/feature/authentication/service/auth_service.dart';
import 'package:wac_sports/feature/authentication/service/deep_link_service.dart';
import 'package:wac_sports/feature/authentication/view_model/auth_view_model.dart';

final sl = GetIt.instance;

setupDependencyIndejection() {
  sl.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  sl.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  sl.registerSingleton<FirebaseDynamicLinks>(FirebaseDynamicLinks.instance);

  sl.registerSingleton<AuthRepository>(
      AuthService(sl<FirebaseAuth>(), sl<FirebaseFirestore>()));
  sl.registerSingleton<DeepLinkService>(
      DeepLinkService(sl<FirebaseDynamicLinks>()));

  sl.registerFactory(() => AuthViewModel(authRepository: sl<AuthRepository>()));
}
