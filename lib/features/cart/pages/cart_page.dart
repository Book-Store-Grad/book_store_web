import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/widgets/footer.dart';
import '../../home/widgets/app_bar.dart';
import '../widgets/cart_item.dart';
import 'checkout_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  static const String routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 125.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Your Cart',
                    style: TextStyle(
                      fontSize: 35.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {
                      context.go(CheckoutPage.routeName);
                    },
                    color: const Color(0xff00A3FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    height: 50.h,
                    minWidth: 180.w,
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: [
                        Text(
                          'Go To Checkout',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Icon(
                          CupertinoIcons.right_chevron,
                          size: 16.r,
                          color: Colors.white,
                        ),
                      ],
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
                      itemBuilder: (context, index) => const CartItem(),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 30.h),
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
