part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class SwitchPasswordShowState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String role;

  LoginSuccessState(this.role);
}

class LoginFailureState extends LoginState {
  final String error;

  LoginFailureState(this.error);
}

class LogoutState extends LoginState {}

class ForgotPasswordLoadingState extends LoginState {}

class ForgotPasswordSuccessState extends LoginState {}

class ForgotPasswordFailureState extends LoginState {}

class VerifyCodeLoadingState extends LoginState {}

class VerifyCodeSuccessState extends LoginState {}

class VerifyCodeFailureState extends LoginState {}

class ResetPasswordLoadingState extends LoginState {}

class ResetPasswordSuccessState extends LoginState {}

class ResetPasswordFailureState extends LoginState {}
