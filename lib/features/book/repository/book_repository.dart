
import 'package:dio/dio.dart';

import '../../../core/constants/api_constants.dart';

class BookRepository {
  Future<Response> getBook({
    required int id,
  }) async {
    return await Dio().get(
      '${ApiConstants.book}/$id',
      options: Options(
        contentType: Headers.jsonContentType,
        validateStatus: (_) => true,
      ),
    );
  }

  Future<Response> getBookFile({
    required int bookId,
  }) async {
    return await Dio().get(
      '${ApiConstants.book}/$bookId/file' '',
    );
  }
}
