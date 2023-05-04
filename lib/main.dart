import 'package:book_store_web/business_logic/author/author_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_strategy/url_strategy.dart';

import 'business_logic/home/home_cubit.dart';
import 'business_logic/login/login_cubit.dart';
import 'business_logic/sign_up/sign_up_cubit.dart';
import 'config/go_router.dart';
import 'core/utils/scroll_behaviour.dart';
import 'styles/app_themes.dart';

void main() async{
  setPathUrlStrategy();
  runApp(const BookStore());
}

class BookStore extends StatelessWidget {
  const BookStore({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1366, 768),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubit()..getAlLBooks(),
          ),
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
          BlocProvider(
            create: (context) => SignUpCubit(),
          ),
          BlocProvider(
            create: (context) => AuthorCubit(),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Book Store',
          theme: AppThemes.lightTheme,
          scrollBehavior: MyCustomScrollBehavior(),
          routerConfig: router,
        ),
      ),
    );
  }
}
