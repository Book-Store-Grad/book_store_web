import 'package:book_store_web/features/auth/pages/forget_password_page.dart';
import 'package:book_store_web/features/auth/pages/login_page.dart';
import 'package:book_store_web/features/auth/pages/reset_password_page.dart';
import 'package:book_store_web/features/auth/pages/signup_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginPage.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );

    case SignUpPage.routeName:
      return MaterialPageRoute(
        builder: (context) => const SignUpPage(),
      );

    case ForgetPasswordPage.routeName:
      return MaterialPageRoute(
        builder: (context) => const ForgetPasswordPage(),
      );

    case ResetPasswordPage.routeName:
      return MaterialPageRoute(
        builder: (context) => const ResetPasswordPage(),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("Screen doesn't exist!"),
          ),
        ),
      );
  }
}
