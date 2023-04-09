import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles/app_colors.dart';

class AuthFormField extends StatelessWidget {
  final String label;
  final String hint;

  const AuthFormField({
    super.key,
    required this.label,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10.h),
        TextFormField(
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
            filled: true,
            fillColor: AppColors.fieldColor,
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 11.5.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.hintTextColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10).r,
              borderSide: BorderSide.none,
            ),
            constraints: BoxConstraints(
              maxWidth: 350.w,
              maxHeight: 50.h,
            ),
            isDense: true,
          ),
          textAlignVertical: TextAlignVertical.center,
        ),
      ],
    );
  }
}
