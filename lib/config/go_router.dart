import 'package:book_store_web/features/author/pages/author_books_page.dart';
import 'package:book_store_web/models/book.dart';
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
      builder: (context, state) {
        Book book = state.extra as Book;
        return BookPage(book: book);
      },
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
    GoRoute(
      path: AuthorBooksPage.routeName,
      builder: (context, state) => const AuthorBooksPage(),
    ),
  ],
  redirect: (context, state) async {
    if(state.location == '/') {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      String? role = prefs.getString('role');
      bool isLogged = token != null && token != '';
      if(isLogged) {
        if(role!.toLowerCase() == 'author') {
          return AuthorBooksPage.routeName;
        } else {
          return HomePage.routeName;
        }
      } else {
        return LoginPage.routeName;
      }
    }
    return null;
  },
);
