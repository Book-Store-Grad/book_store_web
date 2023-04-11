import 'package:dio/dio.dart';

import '../../../core/constants/api_constants.dart';

class SignUpRepository {
  Future<Response> signUpUser({
    required Object? data,
  }) async {
    Response response = await Dio().post(
      ApiConstants.signup,
      data: data,
      options: Options(
        contentType: Headers.jsonContentType,
        validateStatus: (_) => true,
      ),
    );
    return response;
  }
}
