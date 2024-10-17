import 'package:wac_sports/feature/authentication/model/auth_input_model.dart';
import 'package:wac_sports/feature/authentication/model/auth_result.dart';

abstract class AuthRepository {
  Future<AuthResult> loginWithEmailAndPassword(AuthInputModel authData);
  Future<AuthResult> signUpWithEmailAndPassword(AuthInputModel authData);
}
