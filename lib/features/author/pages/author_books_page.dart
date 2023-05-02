import 'package:book_store_web/shared/widgets/footer.dart';
import 'package:book_store_web/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/asset_imgaes.dart';
import '../../home/widgets/app_bar.dart';

class AuthorBooksPage extends StatelessWidget {
  const AuthorBooksPage({Key? key}) : super(key: key);

  static const String routeName = '/author-books';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, isAuthor: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 125.w, vertical: 40.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Your Books',
                        style: TextStyle(
                          fontSize: 33.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      MaterialButton(
                        onPressed: () {},
                        color: AppColors.blueButtonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        height: 50.h,
                        minWidth: 185.w,
                        padding: EdgeInsets.zero,
                        child: Text(
                          'Add Book',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: Column(
                      children: [
                        SizedBox(height: 45.h),
                        ListView.separated(
                          itemBuilder: (context, index) => Row(
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
                                      'The Book Cover',
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
                            ],
                          ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 30.h),
                          itemCount: 5,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
