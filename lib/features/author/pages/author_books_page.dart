import 'package:book_store_web/business_logic/author/author_cubit.dart';
import 'package:book_store_web/features/author/widgets/add_image_dialog.dart';
import 'package:book_store_web/features/favorites/widgets/favourite_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/widgets/app_bar.dart';
import '../../../shared/widgets/footer.dart';
import '../../../styles/app_colors.dart';
import '../widgets/author_book.dart';

class AuthorBooksPage extends StatelessWidget {
  const AuthorBooksPage({Key? key}) : super(key: key);

  static const String routeName = '/author-books';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthorCubit()..getAuthorBooks(),
      child: BlocBuilder<AuthorCubit, AuthorState>(
        builder: (context, state) {
          AuthorCubit cubit = BlocProvider.of<AuthorCubit>(context);
          return Scaffold(
            appBar: appBar(context, isAuthor: true),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 125.w,
                      vertical: 40.h,
                    ),
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
                                  builder: (context) => const AddImage(),
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
                                itemBuilder: (context, index) => cubit
                                        .authorBooks.isEmpty
                                    ? const FavSkeleton()
                                    : AuthorBook(
                                        bookId: cubit.authorBooks[index].id!,
                                        bookName:
                                            cubit.authorBooks[index].name!,
                                        bookDescription: cubit
                                            .authorBooks[index].description!,
                                        bookImageUrl:
                                            cubit.authorBooks[index].bookImage!,
                                      ),
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 30.h),
                                itemCount: cubit.authorBooks.length,
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
      ),
    );
  }
}
