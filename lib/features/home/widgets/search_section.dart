import 'package:book_store_web/business_logic/home/home_cubit.dart';
import 'package:book_store_web/features/home/pages/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../styles/app_colors.dart';

class SearchSection extends StatelessWidget {
  final TextEditingController searchController;

  const SearchSection({
    super.key,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
          filled: true,
          fillColor: AppColors.fieldColor,
          hintText: 'Search Product Name',
          hintStyle: TextStyle(
            fontSize: 13.75.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xff777777),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10).r,
            borderSide: BorderSide.none,
          ),
          constraints: BoxConstraints(
            maxWidth: 800.w,
            maxHeight: 50.h,
          ),
          isDense: true,
          suffixIcon: IconButton(
            icon: Icon(
              CupertinoIcons.search,
              size: 18.r,
              color: const Color(0xff1a1a1a),
            ),
            onPressed: () {
              BlocProvider.of<HomeCubit>(context).searchBook();
            },
            hoverColor: Colors.transparent,
          ),
        ),
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
        onTap: () {
          context.go(SearchPage.routeName);
        },
      ),
    );
  }
}
