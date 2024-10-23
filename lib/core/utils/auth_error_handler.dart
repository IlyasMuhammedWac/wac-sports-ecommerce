String getErrorMessage(String code) {
  switch (code) {
    // Sign In / Sign Up Errors
    case 'user-not-found':
      return 'No user found with this email address.';
    case 'wrong-password':
      return 'Incorrect password. Please try again.';
    case 'invalid-email':
      return 'The email address is badly formatted.';
    case 'user-disabled':
      return 'This user account has been disabled.';
    case 'email-already-in-use':
      return 'An account already exists with this email address.';
    case 'operation-not-allowed':
      return 'This operation is not allowed. Please contact support.';
    case 'weak-password':
      return 'The password is too weak. Please choose a stronger password.';
    case 'invalid-credential':
      return 'The provided credential is invalid or has expired.';
    case 'account-exists-with-different-credential':
      return 'An account already exists with the same email address but different sign-in credentials.';

    // Password Reset Errors
    case 'expired-action-code':
      return 'The password reset code has expired.';
    case 'invalid-action-code':
      return 'The password reset code is invalid. Please request a new one.';

    // Email Verification Errors
    case 'too-many-requests':
      return 'We have blocked all requests from this device due to unusual activity. Try again later.';

    // Network Errors
    case 'network-request-failed':
      return 'A network error occurred. Please check your connection and try again.';

    // General Errors
    case 'internal-error':
      return 'An internal error occurred. Please try again later.';
    case 'invalid-api-key':
      return 'Your API key is invalid, please check your configuration.';
    case 'app-not-authorized':
      return 'This app is not authorized to use Firebase Authentication with the provided API key.';

    default:
      return 'An unexpected error occurred. Please try again or contact support.';
  }
}
