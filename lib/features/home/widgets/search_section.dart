import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles/app_colors.dart';

class SearchSection extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String>? onChanged;

  const SearchSection({
    super.key,
    required this.searchController, this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 176.h,
      width: double.infinity,
      color: const Color(0x757e7e7e),
      child: Align(
        alignment: Alignment.center,
        child: TextField(
          controller: searchController,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
            filled: true,
            fillColor: AppColors.fieldColor,
            hintText: 'Search Product Name',
            hintStyle: TextStyle(
              fontSize: 10.5.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.hintTextColor,
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
            suffixIcon: Icon(
              CupertinoIcons.search,
              size: 18.r,
              color: const Color(0xff0C1A30),
            ),
          ),
          textAlignVertical: TextAlignVertical.center,
        ),
      ),
    );
  }
}
