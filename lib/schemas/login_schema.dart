class LoginSchema {
  String email;
  String password;

  LoginSchema({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {"username": email, "password": password};
  }
}
