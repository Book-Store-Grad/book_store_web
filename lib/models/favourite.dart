class Favourite {
  dynamic favId;
  dynamic bookId;
  String? createdOn;

  Favourite.fromJson(Map<String, dynamic> json) {
    favId = json["fa_id"];
    bookId = json["b_id"];
    createdOn = json["fa_created_on"];
  }
}
