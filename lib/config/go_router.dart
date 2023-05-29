import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/auth/pages/forgot_password_page.dart';
import '../features/auth/pages/login_page.dart';
import '../features/auth/pages/reset_password_page.dart';
import '../features/auth/pages/signup_page.dart';
import '../features/auth/pages/verification_page.dart';
import '../features/author/pages/author_book_page.dart';
import '../features/author/pages/author_books_page.dart';
import '../features/book/pages/book_page.dart';
import '../features/cart/pages/cart_page.dart';
import '../features/cart/pages/checkout_page.dart';
import '../features/cart/pages/order_details_page.dart';
import '../features/cart/pages/order_state_page.dart';
import '../features/favorites/pages/favorites_page.dart';
import '../features/home/pages/home_page.dart';
import '../features/home/pages/search_page.dart';
import '../features/profile/pages/profile_page.dart';
import '../shared/pages/about_us_page.dart';

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
      path: SearchPage.routeName,
      builder: (context, state) => const SearchPage(),
    ),
    GoRoute(
      path: ProfilePage.routeName,
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      name: BookPage.name,
      path: BookPage.routeName,
      builder: (context, state) {
        return BookPage(
          id: int.parse(state.params['id']!),
        );
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
    GoRoute(
      path: VerificationPage.routeName,
      builder: (context, state) => const VerificationPage(),
    ),
    GoRoute(
      path: AboutUsPage.routeName,
      builder: (context, state) => const AboutUsPage(),
    ),
    GoRoute(
      name: AuthorBookPage.name,
      path: AuthorBookPage.routeName,
      builder: (context, state) {
        return AuthorBookPage(
          id: int.parse(state.params['id']!),
        );
      },
    ),
  ],
  redirect: (context, state) async {
    if (state.location == '/') {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      String? role = prefs.getString('role');
      bool isLogged = token != null && token != '';
      if (isLogged) {
        if (role!.toLowerCase() == 'author') {
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
