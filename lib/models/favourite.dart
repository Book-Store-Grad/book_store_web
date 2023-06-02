class Favourite {
  dynamic favId;
  dynamic bookId;
  String? createdOn;
  String? bookName;
  String? description;

  Favourite.fromJson(Map<String, dynamic> json) {
    favId = json["fa_id"];
    bookId = json["b_id"];
    bookName = json['b_name']??'';
    description =json['b_description']??'';
    createdOn = json["fa_created_on"];
  }
}
