import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthErrorDialog extends StatelessWidget {
  final String error;
  const AuthErrorDialog({
    super.key, required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Error',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
              color: Colors.red,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            error,
            style: TextStyle(
              fontSize: 20.sp,
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
    );
  }
}
