import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wac_sports/core/utils/auth_error_handler.dart';
import 'package:wac_sports/feature/authentication/model/auth_input_model.dart';
import 'package:wac_sports/feature/authentication/model/auth_result.dart';
import 'package:wac_sports/feature/authentication/repo/auth_repo.dart';

class AuthService extends AuthRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  AuthService(this._auth, this._firestore);
  @override
  Future<AuthResult> loginWithEmailAndPassword(AuthInputModel authData) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: authData.email!, password: authData.password!);
      return AuthResult(result: true, message: "Welcome back");
    } on FirebaseAuthException catch (e) {
      return AuthResult(result: false, message: getErrorMessage(e.code));
    } catch (e) {
      return AuthResult(result: false, message: "something went wrong");
    }
  }

  @override
  Future<AuthResult> signUpWithEmailAndPassword(AuthInputModel authData) async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
          email: authData.email!, password: authData.password!);
      await _firestore
          .collection("users")
          .doc(user.user?.uid)
          .set({"uid": user.user?.uid, ...authData.toJson()});
      return AuthResult(result: true, message: "Your account has been created");
    } on FirebaseAuthException catch (e) {
      return AuthResult(result: false, message: getErrorMessage(e.code));
    } catch (e) {
      return AuthResult(result: false, message: "Something went wrong");
    }
  }

  @override
  Future<AuthResult> forgotPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(
          email: email,
          actionCodeSettings: ActionCodeSettings(
            url: 'https://demosports.page.link/resetPasswordScreen',
            androidPackageName: 'com.example.wac_sports',
            androidInstallApp: true,
            handleCodeInApp: true,
            
          ));
      return AuthResult(result: true, message: "Email send to $email");
    } on FirebaseAuthException catch (e) {
      return AuthResult(result: false, message: getErrorMessage(e.code));
    } catch (e) {
      return AuthResult(result: false, message: "Someting went wrong");
    }
  }

  @override
  Future<AuthResult> updatePassword(String newPassword, String code) async {
    try {
      await _auth.confirmPasswordReset(code: code, newPassword: newPassword);
      return AuthResult(
          result: true,
          message:
              "Your password has been successfully updated. You can login with your new password");
    } on FirebaseAuthException catch (e) {
      return AuthResult(result: false, message: getErrorMessage(e.code));
    } catch (e) {
      return AuthResult(result: false, message: "Something went wrong");
    }
  }
}
