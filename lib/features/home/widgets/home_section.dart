import 'package:book_store_web/shared/widgets/default_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/book.dart';
import 'book_item.dart';
import 'scroll_button.dart';

class HomeSection extends StatefulWidget {
  final String label;
  final GlobalKey scrollKey;
  final List<Book> books;

  const HomeSection({
    super.key,
    required this.label,
    required this.scrollKey,
    required this.books,
  });

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 500,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 500,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: widget.scrollKey,
      children: [
        SizedBox(height: 20.h),
        Text(
          widget.label,
          style: TextStyle(
            fontFamily: 'DMMono',
            fontWeight: FontWeight.w500,
            fontSize: 22.sp,
          ),
        ),
        SizedBox(
          height: 22.h,
          width: 90.w,
          child: Divider(
            color: Colors.black,
            thickness: 2.5.r,
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 350.h,
          width: 1500.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 50.w,
                child: ScrollButton(isLeft: true, onPressed: _scrollLeft),
              ),
              SizedBox(
                width: 15.w,
              ),
              SizedBox(
                width: 900.w,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => widget.books.isEmpty
                      ? DefaultSkeleton(height: 210.h, width: 150.w)
                      : BookItem(
                          book: widget.books[index],
                        ),
                  separatorBuilder: (context, index) => SizedBox(width: 5.w),
                  itemCount: widget.books.isEmpty ? 8 : widget.books.length,
                  controller: _scrollController,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              SizedBox(
                width: 50.w,
                child: ScrollButton(isLeft: false, onPressed: _scrollRight),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
