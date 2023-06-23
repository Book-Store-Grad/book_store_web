import 'dart:io';
import 'package:book_store_web/core/constants/api_constants.dart';
import 'package:book_store_web/core/constants/app_constants.dart';
import 'package:dio/dio.dart';

class ProfileRepo {
  Future<Response> getProfile() async {
    return await Dio().get(ApiConstants.profile,
        options: Options(
          contentType: Headers.jsonContentType,
          validateStatus: (_) => true,
          headers: {
            'Authorization': 'Bearer $token',
          },
        ));
  }

  Future<Response> editProfile({
    required String email,
    required String name,
    required String gender,
  }) async {
    return await Dio().get(ApiConstants.profile,
        data: {"name": name,  "gender": gender},
        options: Options(
          contentType: Headers.jsonContentType,
          validateStatus: (_) => true,
          headers: {
            'Authorization': 'Bearer $token',
          },
        ));
  }

  File? image;

  // chooseImage() async {
  //   final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     image = File(pickedFile.path);
  //   }
  //  emit(ChooseImageState());
  // }

  Future<Response> updateImage() async {
    return await Dio().post(ApiConstants.profileImage,
        data: {
          "image": await MultipartFile.fromFile(
            image!.path,
            filename: image!.path.split('/').last,
            //  contentType: MediaType('image', 'jpg'),
          )
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          validateStatus: (_) => true,
          headers: {
            'Authorization': 'Bearer $token',
          },
        ));
  }
}
