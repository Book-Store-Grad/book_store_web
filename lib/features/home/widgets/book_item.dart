import 'package:book_store_web/core/constants/api_constants.dart';
import 'package:book_store_web/features/book/pages/book_page.dart';
import 'package:book_store_web/models/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../styles/app_colors.dart';

class BookItem extends StatelessWidget {
  final Book book;

  const BookItem({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed(BookPage.name, params: {'id': book.id.toString()});
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6).r,
        ),
        child: SizedBox(
          width: 220.w,
          height: 450.h,
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 13.w),
              child: Column(
                children: [
                  Image.network(
                    ApiConstants.imageUrl +book.coverImageUrl!,
                    height: 270.h,
                    width: 190.w,
                    fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) => Center(
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            "assets/images/cover.png",
                            height: 270.h,
                            width: 190.w,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      book.name!,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      book.price == 0 ? 'Free' : '${book.price} EGP',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: book.price == 0 ? Colors.green:AppColors.primary,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
