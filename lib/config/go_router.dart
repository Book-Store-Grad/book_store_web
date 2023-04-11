import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/auth/pages/forgot_password_page.dart';
import '../features/auth/pages/login_page.dart';
import '../features/auth/pages/reset_password_page.dart';
import '../features/auth/pages/signup_page.dart';
import '../features/book/pages/book_page.dart';
import '../features/cart/pages/cart_page.dart';
import '../features/cart/pages/checkout_page.dart';
import '../features/cart/pages/order_details_page.dart';
import '../features/cart/pages/order_state_page.dart';
import '../features/favorites/pages/favorites_page.dart';
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
      path: ForgotPasswordPage.routeName,
      builder: (context, state) => const ForgotPasswordPage(),
    ),
    GoRoute(
      path: ResetPasswordPage.routeName,
      builder: (context, state) => const ResetPasswordPage(),
    ),
    GoRoute(
      path: HomePage.routeName,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: BookPage.routeName,
      builder: (context, state) => const BookPage(),
    ),
    GoRoute(
      path: FavoritesPage.routeName,
      builder: (context, state) => const FavoritesPage(),
    ),
    GoRoute(
      path: CartPage.routeName,
      builder: (context, state) => const CartPage(),
    ),
    GoRoute(
      path: OrderDetailsPage.routeName,
      builder: (context, state) => const OrderDetailsPage(),
    ),
    GoRoute(
      path: CheckoutPage.routeName,
      builder: (context, state) => const CheckoutPage(),
    ),
    GoRoute(
      path: OrderStatePage.routeName,
      builder: (context, state) => const OrderStatePage(),
    ),
  ],
  redirect: (context, state) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogged = prefs.getString('token') != null;
    if (state.location == '/') {
      if (isLogged) {
        return HomePage.routeName;
      } else {
        return LoginPage.routeName;
      }
    }
    return null;
  },
);
