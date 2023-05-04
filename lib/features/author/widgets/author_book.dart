import 'package:book_store_web/features/author/pages/author_book_page.dart';
import 'package:book_store_web/models/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/asset_imgaes.dart';

class AuthorBook extends StatelessWidget {
  const AuthorBook({
    super.key,
    required this.book,
  });

  final Book book;

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
              TextButton(
                onPressed: () =>
                    context.go(AuthorBookPage.routeName, extra: book),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  'The Book Cover',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
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
      ],
    );
  }
}
