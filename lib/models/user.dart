class User {
  String? accessToken;
  int? id;
  String? name;
  String? email;
  dynamic imageUrl;
  dynamic gender;
  String? role;

  User.fromJson(Map<String, dynamic> json) {
    accessToken = json["access_token"];
    id = json["content"]["customer"]["cu_id"];
    name = json["content"]["customer"]["cu_name"];
    email = json["content"]["customer"]["cu_email"];
    imageUrl = json["content"]["customer"]["cu_image_url"];
    gender = json["content"]["customer"]["cu_gender"];
    role = json["content"]["customer"]["cu_role"];
  }
}