class Cart {
  dynamic cartId;
  dynamic bookId;
  String? createdOn;
  String? bookName;
  dynamic bookPrice;
  String? bookDescription;

  Cart.fromJson(Map<String, dynamic> json) {
    cartId = json["cai_id"];
    bookId = json["b_id"];
    createdOn = json["cai_created_on"];
    bookName = json["b_name"];
    bookPrice = json["b_price"];
    bookDescription = json["b_description"];
  }
}
