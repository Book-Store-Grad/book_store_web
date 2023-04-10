import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: AppColors.primarySwatch,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'DmSans',
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            return Colors.transparent;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return AppColors.primary;
            }
            return Colors.black;
          },
        ),
        textStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (Set<MaterialState> states) {
            return TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21.sp,
            );
          },
        ),
      ),
    ),
  );
}

