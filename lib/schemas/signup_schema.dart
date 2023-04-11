class SignUpSchema {
  String name;
  String email;
  String password;
  String gender;
  String role;

  SignUpSchema({
    required this.name,
    required this.email,
    required this.password,
    required this.gender,
    required this.role,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "gender": gender,
      "role": role
    };
  }
}
