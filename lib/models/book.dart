class Book {
  bool? isFree;
  bool? isOwned;
  int? authId;
  String? bookImage;
  int? id;
  String? name;
  String? description;
  String? category;
  String? coverImageUrl;
  int? price;

  Book.fromJson(Map<String, dynamic> json) {
    isFree=json["is_free"];
    isOwned=json["is_owned"];
    authId=json["a_id"];
    bookImage=json["cover_image_url"];
    id = json["b_id"];
    name = json["b_name"];
    description = json["b_description"];
    category = json["b_genre"];
    coverImageUrl = json["cover_image_url"];
    price = json["b_price"];
  }
}