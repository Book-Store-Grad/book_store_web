import 'package:dio/dio.dart';

import '../../../core/constants/api_constants.dart';
import '../../../core/constants/app_constants.dart';

class CartRepository {
  Future<Response> getAllCartItems() async {
    return await Dio().get(
      ApiConstants.getAllCart,
      options: Options(
        contentType: Headers.jsonContentType,
        validateStatus: (_) => true,
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  Future<Response> addToCart({
    required int bookId,
  }) async {
    return await Dio().post(
      ApiConstants.cart,
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

  Future<Response> removeFromCart({
    required int bookId,
  }) async {
    return await Dio().delete(
      '${ApiConstants.cart}/$bookId',
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
