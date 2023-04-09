import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/asset_imgaes.dart';

PreferredSizeWidget authAppBar() =>  AppBar(
  toolbarHeight: 90.h,
  backgroundColor: Colors.white,
  foregroundColor: Colors.black,
  elevation: 7,
  title: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25).w,
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
);