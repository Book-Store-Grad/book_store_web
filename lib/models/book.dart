class Book {
  bool? free;
  bool? owned;
  int? authId;
  String? bookImage;
  int? id;
  String? name;
  String? description;
  String? category;
  int? price;

  Book();

  Book.fromJson(Map<String, dynamic> json) {
    free=json["is_free"];
    owned=json["is_owned"];
    authId=json["a_id"];
    bookImage=json["cover_image_url"];
    id = json["b_id"];
    name = json["b_name"];
    description = json["b_description"];
    category = json["b_genre"];
    price = json["b_price"];
  }
}