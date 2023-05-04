class BookSchema {
  String name;
  String description;
  String category;
  String price;

  BookSchema({
    required this.name,
    required this.description,
    required this.category,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "genre": category,
      "price": price,
    };
  }
}
