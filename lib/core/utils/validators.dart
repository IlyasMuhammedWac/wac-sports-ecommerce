class Validators {
  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return "Email is required";
    }
    const regex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    if (!RegExp(regex).hasMatch(email)) {
      return "Please enter valid email";
    }
    return null;
  }

  static String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return "password is required";
    }

    if (password.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  static String? usernameValidator(String? username) {
    if (username == null || username.isEmpty) {
      return "Username is required";
    }

    // Check if the username length is less than 3
    if (username.length < 3) {
      return "Username must be at least 3 characters";
    }

    // Optional: You can add more checks (e.g., only alphanumeric characters)
    final regex = RegExp(r'^[a-zA-Z0-9_]+$');
    if (!regex.hasMatch(username)) {
      return "Username can only contain letters, numbers, and underscores";
    }

    return null;
  }
}
