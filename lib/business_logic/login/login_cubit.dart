import 'package:book_store_web/core/constants/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  User? user;

  Future<void> loginUser() async {
    emit(LoginLoadingState());
    Response response = await loginRepository.loginUser(
      data: loginSchema.toJson(),
    );
    if (response.statusCode == 200) {
      user = User.fromJson(response.data);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', user!.accessToken!);
      await prefs.setString('role', user!.role!);
      token = user!.accessToken!;
      role = user!.role!;
      emit(LoginSuccessState(user!.role!));
    } else if (response.statusCode == 400) {
      emit(LoginFailureState(response.data["detail"]));
    }
  }

  logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', '');
    await prefs.setString('role', '');
    token = '';
    role = '';
    user = null;
    emit(LogoutState());
    Future.delayed(
      const Duration(seconds: 2),
      () {
        emit(LoginInitial());
      },
    );
  }

  final TextEditingController forgotPasswordEmailController =
      TextEditingController();

  final TextEditingController verificationCode = TextEditingController();

  String enteredOTP = '';

  Future<void> forgotPassword() async {
    emit(ForgotPasswordLoadingState());
    try {
      Response response = await loginRepository.forgotPassword(
        email: forgotPasswordEmailController.text,
      );
      verificationCode.text = response.data["content"]["code"].toString();
      emit(ForgotPasswordSuccessState());
      Future.delayed(
        const Duration(seconds: 5),
        () => emit(
          LoginInitial(),
        ),
      );
    } catch (e) {
      emit(ForgotPasswordFailureState());
    }
  }

  void checkOTP({required String oTP}) {
    emit(VerifyCodeLoadingState());
    Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        if (oTP == verificationCode.text) {
          emit(VerifyCodeSuccessState());
        } else {
          emit(VerifyCodeFailureState());
        }
      },
    );
  }

  final TextEditingController newPasswordController = TextEditingController();

  Future<void> resetPassword() async {
    emit(ResetPasswordLoadingState());
    try {
      await loginRepository.resetPassword(
        code: verificationCode.text,
        newPassword: newPasswordController.text,
      );
      emit(ResetPasswordSuccessState());
    } catch (e) {
      emit(ResetPasswordFailureState());
    }
  }
}
