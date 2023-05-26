import 'package:book_store_web/features/book/pages/book_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/asset_imgaes.dart';
import '../../../models/book.dart';
import '../../../styles/app_colors.dart';

class SearchItem extends StatelessWidget {
  final Book book;

  const SearchItem({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.goNamed(BookPage.name, params: {'id': book.id.toString()}),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6).r,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding:
            const EdgeInsets.all(15).r,
            child: Column(
              children: [
                Image.asset(
                  AssetImages.cover,
                  height: 275.h,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    book.name!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 8.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${book.price} EGP',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.5.sp,
                      color: AppColors.primary,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
