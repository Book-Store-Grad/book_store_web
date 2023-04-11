import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/repositories/sign_up_repository.dart';
import '../../schemas/signup_schema.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  // Password Show / Hide

  bool passwordHidden = true;

  void switchPassword() {
    passwordHidden = !passwordHidden;
    emit(SwitchPasswordShowState());
  }

  // Sign Up
  SignUpSchema signUpSchema = SignUpSchema(
    name: '',
    email: '',
    password: '',
    gender: '',
    role: '',
  );
  final signupFormKey = GlobalKey<FormState>();
  SignUpRepository signUpRepository = SignUpRepository();

  Future<void> signUpUser() async {
    emit(SignUpLoadingState());
    Response response = await signUpRepository.signUpUser(
      data: signUpSchema.toJson(),
    );
    if (response.statusCode == 200) {
      emit(SignUpSuccessState());
    } else if (response.statusCode == 400) {
      emit(SignUpFailureState(response.data["detail"]));
    } else if (response.statusCode == 422) {
      emit(SignUpFailureState("missing data"));
    }
  }
}
