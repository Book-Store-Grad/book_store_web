import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/asset_imgaes.dart';

PreferredSizeWidget authAppBar(BuildContext context) =>  AppBar(
  toolbarHeight: 90.h,
  backgroundColor: Colors.white,
  foregroundColor: Colors.black,
  elevation: 7,
  title: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25).w,
    child: InkWell(
      onTap: () => context.go('/'),
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
  ),
);