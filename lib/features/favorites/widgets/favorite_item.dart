import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/asset_imgaes.dart';
import '../../../styles/app_colors.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AssetImages.bigCover,
          width: 90.w,
          height: 110.h,
          fit: BoxFit.fill,
        ),
        SizedBox(width: 30.w),
        SizedBox(
          width: 800.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Favorite',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'This is book This is book details for this book this is book details fa This is book details for this book this is book details fa details for this book this is book details fake data to fill this text in this page in this website or application',
                style: TextStyle(
                  fontSize: 18.sp,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {},
          hoverColor: AppColors.primary,
          borderRadius: BorderRadius.circular(50).r,
          child: CircleAvatar(
            radius: 21.r,
            backgroundColor: const Color(0xffD9D9D9),
            foregroundColor: AppColors.primary,
            child: Icon(
              CupertinoIcons.xmark,
              size: 18.r,
            ),
          ),
        ),
      ],
    );
  }
}
