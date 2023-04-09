import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/app_colors.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      color: AppColors.footerColor,
      padding: const EdgeInsets.symmetric(horizontal: 75).w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              'About Us',
              style: TextStyle(
                fontSize: 14.5.sp,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            'Copyright \u00a9 2023',
            style: TextStyle(
              fontSize: 14.5.sp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
