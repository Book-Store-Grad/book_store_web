import 'package:book_store_web/models/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/asset_imgaes.dart';
import '../../../styles/app_colors.dart';

class CheckoutItem extends StatelessWidget {
  const CheckoutItem({
    super.key, required this.bookName, this.bookPrice,
  });
  final String bookName;
  final dynamic bookPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(AssetImages.bigCover, height: 100.h, width: 80.w, fit: BoxFit.fill),
        SizedBox(width: 20.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${bookName}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23.sp,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              '${bookPrice} EGP',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21.5.sp,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
