import 'package:book_store_web/business_logic/author/author_cubit.dart';
import 'package:book_store_web/core/constants/api_constants.dart';
import 'package:book_store_web/features/author/pages/author_book_page.dart';
import 'package:book_store_web/shared/widgets/default_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AuthorBook extends StatelessWidget {
  final int bookId;
  final String bookImageUrl;
  final String bookName;
  final String bookDescription;

  const AuthorBook({
    super.key,
    required this.bookId,
    required this.bookImageUrl,
    required this.bookName,
    required this.bookDescription,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthorCubit, AuthorState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Row(
          children: [
            state is GetAuthorBooksLoadingState
                ? DefaultSkeleton(height: 220.h, width: 155.w)
                : Image.network(
                    ApiConstants.baseUrl + bookImageUrl,
                    width: 155.w,
                    height: 220.h,
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) => Center(
                      child: SizedBox(
                        width: 155.w,
                        height: 220.h,
                        child: Image.asset("assets/images/cover.png"),
                      ),
                    ),
                  ),
            SizedBox(width: 30.w),
            SizedBox(
              width: 800.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  state is GetAuthorBooksLoadingState
                      ? DefaultSkeleton(height: 30.h, width: 150.w)
                      : TextButton(
                          onPressed: () => context.goNamed(
                            AuthorBookPage.name,
                            params: {
                              'id': bookId.toString(),
                            },
                          ),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            bookName,
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                  SizedBox(height: 10.h),
                  state is GetAuthorBooksLoadingState
                      ? Column(
                          children: [
                            DefaultSkeleton(height: 20.h, width: 400.w),
                            SizedBox(
                              height: 8.h,
                            ),
                            DefaultSkeleton(height: 20.h, width: 400.w),
                          ],
                        )
                      : Text(
                          bookDescription,
                          style: TextStyle(
                            fontSize: 18.sp,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
