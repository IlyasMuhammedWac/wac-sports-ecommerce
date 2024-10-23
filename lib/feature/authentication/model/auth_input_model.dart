class AuthInputModel {
  String? email;
  String? username;
  String? password;
  AuthInputModel({this.email, this.username, this.password});

  toJson() => {
        "username": username,
        "email": email,
        "password": password,
      };
}
