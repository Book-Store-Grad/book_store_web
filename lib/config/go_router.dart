import 'package:go_router/go_router.dart';

import '../features/auth/pages/forget_password_page.dart';
import '../features/auth/pages/login_page.dart';
import '../features/auth/pages/reset_password_page.dart';
import '../features/auth/pages/signup_page.dart';
import '../features/home/pages/home_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: LoginPage.routeName,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: LoginPage.routeName,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: SignUpPage.routeName,
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: ForgetPasswordPage.routeName,
      builder: (context, state) => const ForgetPasswordPage(),
    ),
    GoRoute(
      path: ResetPasswordPage.routeName,
      builder: (context, state) => const ResetPasswordPage(),
    ),
    GoRoute(
      path: HomePage.routeName,
      builder: (context, state) => const HomePage(),
    ),
  ],
  redirect: (context, state) {
    if (state.location == '/') {
      return LoginPage.routeName;
    }
  },
);
