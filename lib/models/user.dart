class User {
  String? accessToken;
  int? id;
  String? name;
  String? email;
  dynamic gender;
  String? role;

  User.fromJson(Map<String, dynamic> json) {
    accessToken = json["access_token"];
    id = json["content"]["user"]["u_id"];
    name = json["content"]["user"]["u_name"];
    email = json["content"]["user"]["u_email"];
    gender = json["content"]["user"]["u_gender"];
    role = json["content"]["user"]["u_role"];
  }
}