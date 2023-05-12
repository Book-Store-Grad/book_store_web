import 'package:book_store_web/business_logic/cart/cart_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/asset_imgaes.dart';
import '../../../styles/app_colors.dart';

class CartItem extends StatelessWidget {
  final int cartId;
  final int bookId;
  final String bookName;
  final String bookDescription;

  const CartItem({
    super.key,
    required this.bookId,
    required this.bookName,
    required this.bookDescription, required this.cartId,
  });

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
              Text(
                bookName,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                bookDescription,
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
            BlocProvider.of<CartCubit>(context, listen: false).removeFromCart(cartId: cartId);
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
