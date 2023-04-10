import 'package:book_store_web/features/book/pages/book_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/asset_imgaes.dart';
import '../../../styles/app_colors.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go(BookPage.routeName),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6).r,
        ),
        child: SizedBox(
          width: 150.w,
          height: 210.h,
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding:
              EdgeInsets.symmetric(vertical: 8.h, horizontal: 13.w),
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        AssetImages.cover,
                        height: 155.h,
                        width: 115.w,
                        fit: BoxFit.fill,
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'My Book Cover',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '300 EGP',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 11.sp,
                            color: AppColors.primary,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  Transform.translate(
                    offset: Offset(5.w, -3.h),
                    child: Container(
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(0, 0, 0, 0.25),
                            spreadRadius: 6.r,
                            blurRadius: 12.r,
                            offset: Offset(0.w, 4.h),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 21.r,
                        child: Icon(
                          CupertinoIcons.heart_fill,
                          color: Colors.red,
                          size: 20.r,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
