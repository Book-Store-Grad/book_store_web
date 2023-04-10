import 'package:book_store_web/business_logic/global_cubit/global_cubit.dart';
import 'package:book_store_web/config/go_router.dart';
import 'package:book_store_web/config/scroll_behaviour.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_strategy/url_strategy.dart';

import 'styles/app_themes.dart';

void main() {
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
      builder: (context, child) => BlocProvider(
        create: (context) => GlobalCubit(),
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
