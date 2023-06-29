import 'package:book_store_web/business_logic/favourite/favourite_cubit.dart';
import 'package:book_store_web/core/constants/api_constants.dart';
import 'package:book_store_web/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universal_html/html.dart' as html;

import '../../../business_logic/book/book_cubit.dart';
import '../../../business_logic/cart/cart_cubit.dart';
import '../../../business_logic/home/home_cubit.dart';
import '../../../models/book.dart';
import '../../../shared/widgets/app_bar.dart';
import '../../../shared/widgets/default_skeleton.dart';
import '../../../shared/widgets/footer.dart';
import '../../home/widgets/home_section.dart';

class BookPage extends StatefulWidget {
  final int? id;

  const BookPage({
    Key? key,
    this.id,
  }) : super(key: key);

  static const String name = 'book';
  static const String routeName = '/book/:id';

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  Book? book;

  Future<void> download({required String url}) async {
    html.window.open(url, "_blank");
  }

  void getBook() async {
    await BlocProvider.of<BookCubit>(context, listen: false)
        .getBook(id: widget.id!);
  }

  @override
  void initState() {
    getBook();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, isAuthor: false),
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 165.w,
                    vertical: 50.h,
                  ),
                  child: Row(
                    children: [
                      book ==null
                      ? DefaultSkeleton(height: 530.h, width: 365.w)
                      : Image.network(
                         ApiConstants.imageUrl + book!.coverImageUrl!,
                        height: 530.h,
                        width: 365.w,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) => Center(
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              "assets/images/cover.png",
                              height: 530.h,
                              width: 365.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
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
                                : Text(
                                    '${book!.name}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35.sp,
                                    ),
                                  ),
                            SizedBox(height: 5.h),
                            book == null
                                ? DefaultSkeleton(height: 30.h, width: 400.w)
                                : Text(
                                    '${book!.category}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp,
                                      color: Colors.black.withOpacity(.65),
                                    ),
                                  ),
                            SizedBox(height: 25.h),
                            Container(
                              height: 200.h,
                              width: 500.w,
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(),
                                  right: BorderSide(),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'About Book',
                                      style: TextStyle(
                                          fontSize: 19.sp,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline),
                                    ),
                                    SizedBox(height: 10.h),
                                    book == null
                                        ? SizedBox(
                                            child: SizedBox(
                                              height: 100.h,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  DefaultSkeleton(
                                                    height: 15.h,
                                                    width: 450.w,
                                                  ),
                                                  DefaultSkeleton(
                                                    height: 15.h,
                                                    width: 450.w,
                                                  ),
                                                  DefaultSkeleton(
                                                    height: 15.h,
                                                    width: 450.w,
                                                  ),
                                                  DefaultSkeleton(
                                                    height: 15.h,
                                                    width: 450.w,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : SizedBox(
                                            height: 140.h,
                                            child: SingleChildScrollView(
                                              dragStartBehavior:
                                                  DragStartBehavior.down,
                                              child: Text(
                                                '${book!.description}',
                                                style: TextStyle(
                                                  fontSize: 17.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 35.h),
                            book == null
                                ? DefaultSkeleton(height: 50.h, width: 450.w)
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      BlocProvider(
                                        create: (context) => FavouriteCubit(),
                                        child: BlocConsumer<FavouriteCubit,
                                            FavouriteState>(
                                          listener: (context, state) {},
                                          builder: (context, state) {
                                            return InkWell(
                                              onTap: () {
                                                BlocProvider.of<FavouriteCubit>(
                                                        context)
                                                    .addToFavourite(
                                                  bookId: book!.id!,
                                                );
                                              },
                                              child: state
                                                      is AddToFavouriteLoading
                                                  ? SizedBox(
                                                      height: 20.h,
                                                      width: 20.w,
                                                      child:
                                                          const CircularProgressIndicator(
                                                        color: Colors.red,
                                                      ),
                                                    )
                                                  : Container(
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: const Color
                                                                    .fromRGBO(
                                                                0, 0, 0, 0.25),
                                                            spreadRadius: 2,
                                                            blurRadius: 4,
                                                            offset: Offset(
                                                              0.w,
                                                              2.h,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            Colors.white,
                                                        radius: 28.r,
                                                        child: Icon(
                                                          CupertinoIcons
                                                              .suit_heart,
                                                          color: Colors.red,
                                                          size: 24.r,
                                                        ),
                                                      ),
                                                    ),
                                            );
                                          },
                                        ),
                                      ),
                                      Text(
                                        book!.price == 0
                                            ? 'Free'
                                            : '${book!.price} EGP',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25.sp,
                                          color: book!.price == 0 ?Colors.green :AppColors.primary,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 40.w,
                                      ),
                                      BlocConsumer<CartCubit, CartState>(
                                        listener: (context, state) {},
                                        builder: (context, state) {
                                          if (book!.isFree! ||
                                              book!.isOwned! ||
                                              book!.price == 0) {
                                            return MaterialButton(
                                              onPressed: () {
                                                download(
                                                    url:
                                                        '${ApiConstants.book}/${book!.id}/file');
                                                // BlocProvider.of<BookCubit>(
                                                //         context)
                                                //     .getBookFile(
                                                //   bookId: book!.id!,
                                                //   bName: book!.name!,
                                                // );
                                              },
                                              color: AppColors.green,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                              ),
                                              padding:
                                                  const EdgeInsets.all(20).r,
                                              minWidth: 150.w,
                                              child: state is AddToCartLoading
                                                  ? SizedBox(
                                                      height: 20.h,
                                                      width: 20.w,
                                                      child:
                                                          const CircularProgressIndicator(
                                                        color: Colors.white,
                                                      ),
                                                    )
                                                  : Text(
                                                      'Download',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.white,
                                                        fontSize: 20.sp,
                                                      ),
                                                    ),
                                            );
                                          } else {
                                            return MaterialButton(
                                              onPressed: () {
                                                BlocProvider.of<CartCubit>(
                                                        context)
                                                    .addToCart(
                                                  bookId: book!.id!,
                                                );
                                              },
                                              color: const Color(0xff00A3FF),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                              ),
                                              padding:
                                                  const EdgeInsets.all(20).r,
                                              minWidth: 150.w,
                                              child: state is AddToCartLoading
                                                  ? SizedBox(
                                                      height: 20.h,
                                                      width: 20.w,
                                                      child:
                                                          const CircularProgressIndicator(
                                                        color: Colors.white,
                                                      ),
                                                    )
                                                  : Text(
                                                      'Add To Cart',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.white,
                                                        fontSize: 20.sp,
                                                      ),
                                                    ),
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                HomeSection(
                  label: 'Recommended For You',
                  scrollKey: GlobalKey(),
                  books: BlocProvider.of<HomeCubit>(context).books,
                ),
                SizedBox(height: 20.h),
                const Footer(),
              ],
            );
          },
        ),
      ),
    );
  }
}
