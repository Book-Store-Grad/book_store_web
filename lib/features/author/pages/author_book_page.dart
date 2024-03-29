  import 'package:book_store_web/features/author/widgets/edit_book_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../business_logic/author/author_cubit.dart';
import '../../../business_logic/book/book_cubit.dart';
import '../../../core/utils/asset_imgaes.dart';
import '../../../models/book.dart';
import '../../../shared/widgets/default_skeleton.dart';
import '../../../shared/widgets/footer.dart';
import '../../../styles/app_colors.dart';
import '../../../shared/widgets/app_bar.dart';
import 'author_books_page.dart';

class AuthorBookPage extends StatelessWidget {
  final int? id;

  const AuthorBookPage({
    Key? key,
    this.id,
  }) : super(key: key);

  static const String name = 'author_book';
  static const String routeName = '/author-book/:id';


  @override
  Widget build(BuildContext context) {
    Book? book;
    return BlocProvider(
  create: (context) => BookCubit()..getBook(id: id!),
  child: Scaffold(
      appBar: appBar(context, isAuthor: true),
      body: SingleChildScrollView(
        child: BlocConsumer<BookCubit, BookState>(
          listener: (context, state) {
            if (state is GetBookSuccessState) {
              book = state.book;
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 175.w, vertical: 50.h),
                  child: Row(
                    children: [
                      Image.asset(
                        AssetImages.bigCover,
                        height: 530.h,
                        width: 365.w,
                        fit: BoxFit.fill,
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 500.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            book == null
                                ? DefaultSkeleton(height: 40.h, width: 400.w)
                                : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        '${book!.name}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 35.sp,
                                        ),
                                      ),
                                    SizedBox(height: 5.h,),
                                    Text(
                                      '${book!.category}',
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                            SizedBox(height: 50.h),
                            book == null
                                ? SizedBox(
                                    child: SizedBox(
                                      height: 100.h,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          DefaultSkeleton(
                                              height: 15.h, width: 450.w),
                                          DefaultSkeleton(
                                              height: 15.h, width: 450.w),
                                          DefaultSkeleton(
                                              height: 15.h, width: 450.w),
                                          DefaultSkeleton(
                                              height: 15.h, width: 450.w),
                                        ],
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    height: 220.h,
                                    child: SingleChildScrollView(
                                      dragStartBehavior: DragStartBehavior.down,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'About book',
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 10.h),
                                          Text(
                                            '${book!.description}',
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                            SizedBox(height: 40.h),
                            SizedBox(height: 32.5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                MaterialButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text(
                                          'Are you sure to delete the book?',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17.sp,
                                          ),
                                        ),
                                        content: Row(
                                          children: [
                                            MaterialButton(
                                              onPressed: () {
                                                context.pop();
                                              },
                                              color: Colors.grey,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                              ),
                                              padding:
                                                  const EdgeInsets.all(18).r,
                                              minWidth: 135.w,
                                              child: Text(
                                                'No',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                  fontSize: 16.sp,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 15.w),
                                            BlocConsumer<AuthorCubit,
                                                AuthorState>(
                                              listener: (context, state) {
                                                if (state
                                                    is DeleteBookSuccessState) {
                                                  Future.delayed(
                                                    const Duration(seconds: 1),
                                                    () {
                                                      context.go(
                                                        AuthorBooksPage
                                                            .routeName,
                                                      );
                                                    },
                                                  );
                                                }
                                              },
                                              builder: (context, state) {
                                                AuthorCubit cubit = BlocProvider
                                                    .of<AuthorCubit>(context);
                                                return state
                                                        is DeleteBookLoadingState
                                                    ? MaterialButton(
                                                        onPressed: () {},
                                                        color:
                                                            AppColors.primary,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            10.r,
                                                          ),
                                                        ),
                                                        padding:
                                                            const EdgeInsets
                                                                    .all(18)
                                                                .r,
                                                        minWidth: 135.w,
                                                        child: SizedBox(
                                                          height: 20.h,
                                                          width: 20.h,
                                                          child:
                                                              const CircularProgressIndicator(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      )
                                                    : state is DeleteBookSuccessState
                                                        ? Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Icon(
                                                                CupertinoIcons
                                                                    .checkmark_rectangle,
                                                                size: 29.r,
                                                                color: AppColors
                                                                    .primary,
                                                              ),
                                                              SizedBox(
                                                                  width: 8.w),
                                                              Text(
                                                                'Successfully deleted',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      15.sp,
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        : MaterialButton(
                                                            onPressed: () {
                                                              cubit.deleteBook(
                                                                id: book!.id!,
                                                              );
                                                            },
                                                            color: AppColors
                                                                .primary,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                10.r,
                                                              ),
                                                            ),
                                                            padding:
                                                                const EdgeInsets
                                                                        .all(18)
                                                                    .r,
                                                            minWidth: 135.w,
                                                            child: Text(
                                                              'Yes',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16.sp,
                                                              ),
                                                            ),
                                                          );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  color: AppColors.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  padding: const EdgeInsets.all(20).r,
                                  minWidth: 150.w,
                                  child: Text(
                                    'Delete',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                MaterialButton(
                                  onPressed: () {
                                    showDialog(context: context, builder: (context) {
                                      AuthorCubit cubit = BlocProvider.of<AuthorCubit>(context);
                                      cubit.editBookNameController.text = book!.name!;
                                      cubit.editBookDescriptionController.text = book!.description!;
                                      cubit.editBookPriceController.text = book!.price!.toString();
                                      return EditBookDialog(book: book!);
                                    },);
                                  },
                                  color: AppColors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  padding: const EdgeInsets.all(20).r,
                                  minWidth: 150.w,
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                const Footer(),
              ],
            );
          },
        ),
      ),
    ),
);
  }
}
