import 'package:book_store_web/business_logic/favourite/favourite_cubit.dart';
import 'package:book_store_web/features/book/pages/book_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/asset_imgaes.dart';
import '../../../styles/app_colors.dart';

class FavoriteItem extends StatelessWidget {
  final int favId;
  final int bookId;
  const FavoriteItem({super.key, required this.favId, required this.bookId});

  @override
  Widget build(BuildContext context) {
    return Row(
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
              TextButton(
                onPressed: () {
                  context.goNamed(BookPage.name, params: {'id': bookId.toString()});
                },
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  "bookName",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "jjj",
                style: TextStyle(
                  fontSize: 18.sp,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            BlocProvider.of<FavouriteCubit>(context, listen: false)
                .removeFromFav(favId: favId);
          },
          hoverColor: AppColors.primary,
          borderRadius: BorderRadius.circular(50).r,
          child: CircleAvatar(
            radius: 21.r,
            backgroundColor: const Color(0xffD9D9D9),
            foregroundColor: AppColors.primary,
            child: Icon(
              CupertinoIcons.xmark,
              size: 18.r,
            ),
          ),
        ),
      ],
    );
  }
}
