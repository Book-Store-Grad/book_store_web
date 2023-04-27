import 'package:book_store_web/business_logic/home/home_cubit.dart';
import 'package:book_store_web/core/utils/asset_imgaes.dart';
import 'package:book_store_web/features/home/widgets/home_section.dart';
import 'package:book_store_web/models/book.dart';
import 'package:book_store_web/shared/widgets/footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/widgets/app_bar.dart';

class BookPage extends StatelessWidget {
  final Book book;
  const BookPage({Key? key, required this.book}) : super(key: key);

  static const String routeName = '/book-name';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 150.w, vertical: 50.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AssetImages.bigCover,
                    height: 590.h,
                    width: 410.w,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(width: 115.w),
                  SizedBox(
                    width: 500.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My Book Cover',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 42.sp,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        SizedBox(
                          height: 250.h,
                          child: SingleChildScrollView(
                            dragStartBehavior: DragStartBehavior.down,
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. LorLorem Ipsum is simply dummy text of the printing and typesetting industry. LorLorem Ipsum is simply dummy text of the printing and typesetting industry. LorLorem Ipsum is simply dummy text of the printing and typesetting industry. LorLorem Ipsum is simply dummy text of the printing and typesetting industry. LorLorem Ipsum is simply dummy text of the printing and typesetting industry. LorLorem Ipsum is simply dummy text of the printing and typesetting industry. LorLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text since the 1500s, when an unknown printer took a galley of type  scrambled it to make a type specimen book.  has survived not only five centuries, but also the leap into  typesetting, remaining essentially unchanged. It was  in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                              style: TextStyle(
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 60.h),
                        Table(
                          border: TableBorder(
                            bottom:
                                BorderSide(color: Colors.black, width: 0.5.w),
                            top: BorderSide(color: Colors.black, width: 0.5.w),
                            horizontalInside:
                                BorderSide(color: Colors.black, width: 0.5.w),
                            verticalInside:
                                BorderSide(color: Colors.black, width: 0.5.w),
                          ),
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(6).r,
                                    child: Text(
                                      '    Author',
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(6).r,
                                    child: Text(
                                      '       Hazem Osama',
                                      style: TextStyle(fontSize: 18.sp),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(6).r,
                                    child: Text(
                                      '    ISBN',
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(6).r,
                                    child: Text(
                                      '       978-123456789',
                                      style: TextStyle(fontSize: 18.sp),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(6).r,
                                    child: Text(
                                      '    Category',
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(6).r,
                                    child: Text(
                                      '       Flutter Development',
                                      style: TextStyle(fontSize: 18.sp),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 35.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          const Color.fromRGBO(0, 0, 0, 0.25),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: Offset(0.w, 2.h),
                                    ),
                                  ],
                                ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 28.r,
                                  child: Icon(
                                    CupertinoIcons.suit_heart,
                                    color: Colors.red,
                                    size: 24.r,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              '10.000 EGP',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.sp,
                              ),
                            ),
                            SizedBox(width: 40.w),
                            MaterialButton(
                              onPressed: () {},
                              color: const Color(0xff00A3FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              padding: const EdgeInsets.all(20).r,
                              minWidth: 150.w,
                              child: Text(
                                'Add To Cart',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 20.sp,
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
            HomeSection(
              label: 'Recommended For You',
              scrollKey: GlobalKey(),
              books: BlocProvider.of<HomeCubit>(context).books,
            ),
            SizedBox(height: 25.h),
          ],
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
