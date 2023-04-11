import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/repositories/login_repository.dart';
import '../../models/user.dart';
import '../../schemas/login_schema.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  // Password Show / Hide

  bool passwordHidden = true;

  void switchPassword() {
    passwordHidden = !passwordHidden;
    emit(SwitchPasswordShowState());
  }

  // Login
  LoginSchema loginSchema = LoginSchema(email: '', password: '');
  final loginFormKey = GlobalKey<FormState>();
  LoginRepository loginRepository = LoginRepository();
  late final User user;

  Future<void> loginUser() async {
    emit(LoginLoadingState());
    Response response = await loginRepository.loginUser(
      data: loginSchema.toJson(),
    );
    if (response.statusCode == 200) {
      user = User.fromJson(response.data);
      emit(LoginSuccessState());
    } else if (response.statusCode == 400) {
      emit(LoginFailureState(response.data["detail"]));
    }
  }
}
