import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'book_item.dart';
import 'scroll_button.dart';

class HomeSection extends StatefulWidget {
  final String label;
  final GlobalKey scrollKey;

  const HomeSection({
    super.key,
    required this.label,
    required this.scrollKey,
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
          height: 215.h,
          width: 1300.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 50.w,
                child: ScrollButton(isLeft: true, onPressed: _scrollLeft),
              ),
              SizedBox(
                width: 1200.w,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => const BookItem(),
                  separatorBuilder: (context, index) => SizedBox(width: 5.w),
                  itemCount: 20,
                  controller: _scrollController,
                ),
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
