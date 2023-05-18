class BookSchema {
  String name;
  String description;
  String genre;
  String price;
  int authorId;

  BookSchema({
    required this.name,
    required this.description,
    required this.genre,
    required this.price,
    required this.authorId,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "genre": genre,
      "price": price,
      "author_id":authorId,
    };
  }
}
