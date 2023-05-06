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
