import 'package:book_store_web/features/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../business_logic/home/home_cubit.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    HomeCubit globalCubit = BlocProvider.of<HomeCubit>(
      context,
    );

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        bool isHome = ModalRoute.of(context)!.settings.name == '/home';
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                if (isHome) {
                  globalCubit.selectNavItem(0, HomeSections.home);
                } else {
                  context.go(HomePage.routeName);
                }
              },
              child: Text(
                'Home',
                style: TextStyle(
                  color: isHome
                      ? globalCubit.selectedNavItemIndex == 0
                          ? Colors.red
                          : Colors.black
                      : Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 21.sp,
                  fontFamily: 'DMMono',
                ),
              ),
            ),
            SizedBox(width: 10.w),
            TextButton(
              onPressed: () {
                if (isHome) {
                  globalCubit.selectNavItem(1, HomeSections.linguistics);
                }
              },
              child: Text(
                'Linguistics',
                style: TextStyle(
                  color: isHome
                      ? globalCubit.selectedNavItemIndex == 1
                          ? Colors.red
                          : Colors.black
                      : Colors.grey[500],
                  fontWeight: FontWeight.w500,
                  fontSize: 21.sp,
                  fontFamily: 'DMMono',
                ),
              ),
            ),
            SizedBox(width: 10.w),
            TextButton(
              onPressed: () {
                if (isHome) {
                  globalCubit.selectNavItem(2, HomeSections.selfDevelopment);
                }
              },
              child: Text(
                'Self-Development',
                style: TextStyle(
                  color: isHome
                      ? globalCubit.selectedNavItemIndex == 2
                          ? Colors.red
                          : Colors.black
                      : Colors.grey[500],
                  fontWeight: FontWeight.w500,
                  fontSize: 21.sp,
                  fontFamily: 'DMMono',
                ),
              ),
            ),
            SizedBox(width: 10.w),
            TextButton(
              onPressed: () {
                if (isHome) {
                  globalCubit.selectNavItem(3, HomeSections.technologies);
                }
              },
              child: Text(
                'Technologies',
                style: TextStyle(
                  color: isHome
                      ? globalCubit.selectedNavItemIndex == 3
                          ? Colors.red
                          : Colors.black
                      : Colors.grey[500],
                  fontWeight: FontWeight.w500,
                  fontSize: 21.sp,
                  fontFamily: 'DMMono',
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
