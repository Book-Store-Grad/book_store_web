import 'package:book_store_web/business_logic/global_cubit/global_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  @override
  Widget build(BuildContext context) {
    GlobalCubit globalCubit = BlocProvider.of<GlobalCubit>(
      context,
    );

    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                globalCubit.selectNavItem(0, HomeSections.home);
              },
              child: Text(
                'Home',
                style: TextStyle(
                  color: globalCubit.selectedNavItemIndex == 0 ? Colors.red : Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 21.sp,
                  fontFamily: 'DMMono',
                ),
              ),
            ),
            SizedBox(width: 10.w),
            TextButton(
              onPressed: () {
                globalCubit.selectNavItem(1, HomeSections.linguistics);
              },
              child: Text(
                'Linguistics',
                style: TextStyle(
                  color: globalCubit.selectedNavItemIndex == 1 ? Colors.red : Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 21.sp,
                  fontFamily: 'DMMono',
                ),
              ),
            ),
            SizedBox(width: 10.w),
            TextButton(
              onPressed: () {
                globalCubit.selectNavItem(2, HomeSections.selfDevelopment);
              },
              child: Text(
                'Self-Development',
                style: TextStyle(
                  color: globalCubit.selectedNavItemIndex == 2 ? Colors.red : Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 21.sp,
                  fontFamily: 'DMMono',
                ),
              ),
            ),
            SizedBox(width: 10.w),
            TextButton(
              onPressed: () {
                globalCubit.selectNavItem(3, HomeSections.technologies);
              },
              child: Text(
                'Technologies',
                style: TextStyle(
                  color: globalCubit.selectedNavItemIndex == 3 ? Colors.red : Colors.black,
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
