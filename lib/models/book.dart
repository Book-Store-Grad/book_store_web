class Book {
  int? id;
  String? name;
  String? description;
  String? genre;
  String? price;

  Book();

  Book.fromJson(Map<String, dynamic> json) {
    id = json["b_id"];
    name = json["b_name"];
    description = json["b_description"];
    genre = json["b_genre"];
    price = json["b_price"];
  }
}