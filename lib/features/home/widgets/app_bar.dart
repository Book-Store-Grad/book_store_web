import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/asset_imgaes.dart';
import '../../../shared/widgets/nav_bar.dart';

PreferredSizeWidget appBar(BuildContext context) => AppBar(
      toolbarHeight: 90.h,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 7,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25).w,
        child: Row(
          children: [
            InkWell(
              onTap:  () => context.go('/'),
              child: Row(
                children: [
                  Image.asset(
                    AssetImages.logo,
                    height: 30.h,
                    width: 30.h,
                  ),
                  SizedBox(width: 15.w),
                  Text(
                    'Bookstore',
                    style: TextStyle(
                      fontFamily: 'DMMono',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const NavBar(),
            const Spacer(),
            Row(
              children: [
                Text(
                  'Profile',
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10.w,
                ),
                const Chip(
                  label: Icon(Icons.keyboard_arrow_down),
                  avatar: Icon(Icons.person),
                  labelPadding: EdgeInsets.zero,
                ),
              ],
            ),
          ],
        ),
      ),
    );
