import 'package:book_store_web/core/constants/api_constants.dart';
import 'package:book_store_web/core/constants/app_constants.dart';
import 'package:dio/dio.dart';

class FavRepository{

  Future<Response> getAllFavourites()async{
    return await Dio().get(
      ApiConstants.getAllFav,
      options: Options(
        contentType: Headers.jsonContentType,
        validateStatus: (_) => true,
        headers: {
          'Authorization': 'Bearer $token',
        },
      )
    );
  }

  Future<Response> addToFav({
    required int bookId,
  }) async {
    return await Dio().post(
      ApiConstants.favorite,
      data: {"book_id": bookId},
      options: Options(
        contentType: Headers.jsonContentType,
        validateStatus: (_) => true,
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  Future<Response> removeFromFav({
    required int favId,
  }) async {
    return await Dio().delete(
      '${ApiConstants.favorite}/$favId',
      options: Options(
        contentType: Headers.jsonContentType,
        validateStatus: (_) => true,
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

}