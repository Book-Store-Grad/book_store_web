import 'package:dio/dio.dart';

import '../../../core/constants/api_constants.dart';

class LoginRepository {
  Future<Response> loginUser({
    required Object? data,
  }) async {
    return await Dio().post(
      ApiConstants.login,
      data: data,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        validateStatus: (_) => true,
      ),
    );
  }

  Future<Response> forgotPassword({
    required String email,
  }) async {
    return await Dio().post(
      ApiConstants.forgetPassword,
      data: {
        "email": email,
      },
      options: Options(
        contentType: Headers.jsonContentType,
        validateStatus: (_) => true,
      ),
    );
  }

  Future<Response> resetPassword({
    required String code,
    required String newPassword,
  }) async {
    return await Dio().post(
      ApiConstants.resetPassword,
      data: {
        "code": code,
        "password": newPassword
      },
      options: Options(
        contentType: Headers.jsonContentType,
        validateStatus: (_) => true,
      ),
    );
  }


}
