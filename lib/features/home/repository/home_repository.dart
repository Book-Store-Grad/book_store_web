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

  Future<Response> getBook({
    required int id,
  }) async {
    Response response = await Dio().get(
      '${ApiConstants.book}/$id',
      options: Options(
        contentType: Headers.jsonContentType,
        validateStatus: (_) => true,
      ),
    );
    return response;
  }

  Future<Response> searchBook({
    required String query,
  }) async {
    return await Dio().get(
      '${ApiConstants.getAllBooks}?query=$query',
      options: Options(
        contentType: Headers.jsonContentType,
        validateStatus: (_) => true,
      ),
    );
  }
}
