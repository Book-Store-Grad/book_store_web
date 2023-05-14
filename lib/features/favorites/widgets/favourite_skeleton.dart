import 'package:book_store_web/shared/widgets/default_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class FavSkeleton extends StatelessWidget {
  const FavSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DefaultSkeleton(height: 110.h, width: 90.w),
        SizedBox(width: 30.w),
        SizedBox(
          width: 800.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultSkeleton(height: 20.h, width: 100.w),
              SizedBox(height: 20.h),
              DefaultSkeleton(height: 10.h, width: 450.w),
              SizedBox(height: 5.h),
              DefaultSkeleton(height: 10.h, width: 450.w),
            ],
          ),
        ),
        const Spacer(),
        DefaultSkeleton(height: 41.h, width: 40.w, borderRadius: 50),
      ],
    );
  }
}
