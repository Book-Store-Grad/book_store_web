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
    required int cartId,
  }) async {
    return await Dio().post(
      ApiConstants.cart,
      data: {"book_id": cartId},
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
    required int cartId,
  }) async {
    return await Dio().delete(
      '${ApiConstants.cart}/$cartId',
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
