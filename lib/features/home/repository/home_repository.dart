import 'package:dio/dio.dart';

import '../../../core/constants/api_constants.dart';

class HomeRepository {

  Future<Response> getAllBooks() async {
    Response response = await Dio().get(
      ApiConstants.getAllBooks,
      options: Options(
        contentType: Headers.jsonContentType,
        validateStatus: (_) => true,
      ),
    );
    return response;
  }
}