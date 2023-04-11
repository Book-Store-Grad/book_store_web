import 'package:dio/dio.dart';

import '../../../core/constants/api_constants.dart';

class LoginRepository {
  Future<Response> loginUser({
    required Object? data,
  }) async {
    Response response = await Dio().post(
      ApiConstants.login,
      data: data,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        validateStatus: (_) => true,
      ),
    );
    return response;
  }
}
