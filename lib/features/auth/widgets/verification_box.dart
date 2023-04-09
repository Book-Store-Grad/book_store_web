import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles/app_colors.dart';

class VerificationBox extends StatelessWidget {
  final int num;
  const VerificationBox({
    super.key, required this.num,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.6.h,
      width: 67.2.w,
      decoration: BoxDecoration(
        color: AppColors.fieldColor,
        borderRadius: BorderRadius.circular(10).r,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          '$num',
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
