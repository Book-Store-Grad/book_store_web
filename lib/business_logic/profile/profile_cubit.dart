import 'dart:io';
import 'package:book_store_web/core/constants/api_constants.dart';
import 'package:book_store_web/core/constants/app_constants.dart';
import 'package:book_store_web/models/profile.dart';
import 'package:book_store_web/network/remote/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';


part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  Uint8List webImage = Uint8List(8);

  Profile? profile;

  void getProfile() {
    {
      emit(ProfileLoadingState());
      DioHelper.getData(
        url: ApiConstants.profile,
        token: token,
      ).then((value) {
        print(value.data);
        if (value.statusCode == 200) {
          profile = Profile.fromJson(value.data);
          nameController.text = profile!.content.customer.cuName;
          emailController.text = profile!.content.customer.cuEmail;
          genderController.text = profile!.content.customer.cuGender;
          print("Get Profile successfully !");
        } else {
          print("Get Profile Error !");
        }
        emit(ProfileSuccessState());
      }).catchError((e) {
        emit(ProfileErrorState());
      });
    }
  }

  void updateProfile({
    required String name,
  }) {
    emit(UpdateProfileLoadingState());
    DioHelper.putData(
        url: ApiConstants.profile,
        token: token,
        data: {"name": name, "gender": genderController.text}).then((value) {
      print(value.data);
      if (value.statusCode == 200) {
        print("Profile Updated successfully !");
      } else {
        print("Profile Edit Error !");
      }
      emit(UpdateProfileSuccessState());
    }).catchError((e) {
      emit(UpdateProfileErrorState());
    });
  }

  File? image;

  chooseImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      var f =await pickedFile.readAsBytes();
      image=File(pickedFile.path);
      webImage = f;
    }
    emit(ChooseImageState());
  }

  void updateProfileImage() async {
    emit(UpdateProfileImageLoadingState());
    DioHelper.postData(
        containImage: true,
        url: ApiConstants.profileImage,
        token: token,
        data: {
          "image": MultipartFile.fromBytes(webImage,
             filename: image!.path.split('/').last,
             // contentType: MediaType('image', 'jpg')
          ),
        }).then((value) {
      print(value.statusCode);
      if (value.statusCode == 200) {
        print("Image Updated Successfully !");
      }
      else{
        print("Somthing went wrong !");
      }
      emit(UpdateProfileImageSuccessState());
    }).catchError((e) {
      emit(UpdateProfileImageErrorState());
    });
  }
}
