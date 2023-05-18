import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/api_constants.dart';
import '../../../core/constants/app_constants.dart';

class AuthorRepository {
  Future<Response> addBook({
    required Object? data,
  }) async {
    Response response = await Dio().post(
      ApiConstants.book,
      data: data,
      options: Options(
        validateStatus: (_) => true,
        headers: {
          'Authorization': 'Bearer $token',
        }

      ),
    );
    return response;
  }

  Future<Response> deleteBook({
    required int id,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    Response response = await Dio().delete(
      '${ApiConstants.book}/$id',
      options: Options(
          validateStatus: (_) => true,
          headers: {
            'Authorization': 'Bearer $token',
          }
      ),
    );
    return response;
  }
}