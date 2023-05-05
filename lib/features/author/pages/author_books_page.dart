import 'package:book_store_web/business_logic/author/author_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/book.dart';
import '../../../shared/widgets/footer.dart';
import '../../../styles/app_colors.dart';
import '../../home/widgets/app_bar.dart';
import '../widgets/add_book_dialog.dart';
import '../widgets/author_book.dart';

class AuthorBooksPage extends StatelessWidget {
  const AuthorBooksPage({Key? key}) : super(key: key);

  static const String routeName = '/author-books';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthorCubit, AuthorState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: appBar(context, isAuthor: true),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 125.w, vertical: 40.h),
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
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => const AddBookDialog(),
                              );
                            },
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
                              itemBuilder: (context, index) =>
                                  AuthorBook(book: Book()),
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
      },
    );
  }
}
