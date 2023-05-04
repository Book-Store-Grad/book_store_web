import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/api_constants.dart';

class AuthorRepository {
  Future<Response> addBook({
    required Object? data,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    Response response = await Dio().post(
      ApiConstants.addBook,
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
}