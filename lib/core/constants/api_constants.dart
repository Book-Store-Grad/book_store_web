class ApiConstants {
  static const String baseUrl = "https://bookstore-api-9pzk.onrender.com";
  ///Auth
  static const String login = "$baseUrl/auth";
  static const String signup = "$baseUrl/auth/signup";
  static const String forgetPassword = "$baseUrl/auth/forget-password";
  static const String resetPassword = "$baseUrl/auth/reset-password";
  ///Books
  static const String getAllBooks = "$baseUrl/book/all";
  static const String book = "$baseUrl/book";
  ///Cart
  static const String getAllCart = '$baseUrl/cart/all';
  static const String cart = '$baseUrl/cart';
  ///Favourite
  static const String getAllFav = '$baseUrl/favorite/all';
  static const String favorite = '$baseUrl/favorite';
  ///Profile
  static const String profile = '$baseUrl/user/profile';
  static const String profileImage = '$baseUrl/user/image';


}