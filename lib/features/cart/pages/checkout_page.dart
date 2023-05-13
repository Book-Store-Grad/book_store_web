import 'package:book_store_web/core/utils/asset_imgaes.dart';
import 'package:book_store_web/features/cart/pages/order_state_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/widgets/footer.dart';
import '../../../styles/app_colors.dart';
import '../../../shared/widgets/app_bar.dart';
import '../widgets/checkout_item.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  static const String routeName = '/checkout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, isAuthor: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 170.w, vertical: 40.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Checkout',
                      style: TextStyle(
                        fontSize: 35.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    MaterialButton(
                      onPressed: () {
                        context.go(OrderStatePage.routeName);
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
                            'Place Order',
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
                SizedBox(height: 50.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 300.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Payment',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24.sp,
                              ),
                            ),
                            SizedBox(height: 35.h),
                            Row(
                              children: [
                                Icon(
                                  CupertinoIcons.checkmark_circle_fill,
                                  size: 18.r,
                                  color: const Color(0xff00A3FF),
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  'Debit / Credit Card',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 19.sp,
                                  ),
                                ),
                                const Spacer(),
                                SvgPicture.asset(AssetImages.visaLogo,
                                    height: 12.h,
                                    width: 30.w,
                                    fit: BoxFit.fill),
                                SizedBox(width: 7.w),
                                SvgPicture.asset(AssetImages.mastercardLogo,
                                    height: 18.h,
                                    width: 30.w,
                                    fit: BoxFit.fill),
                              ],
                            ),
                            SizedBox(
                              width: 320.w,
                              child: const Divider(),
                            ),
                            Row(
                              children: [
                                Icon(
                                  CupertinoIcons.checkmark_circle,
                                  size: 18.r,
                                  color: const Color(0xff00A3FF),
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  'Paypal',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 19.sp,
                                  ),
                                ),
                                const Spacer(),
                                SvgPicture.asset(
                                  AssetImages.paypalLogo,
                                  height: 15.h,
                                  width: 35.w,
                                  fit: BoxFit.fill,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 300.w,
                        height: 200.h,
                        child: ListView.separated(
                          itemBuilder: (context, index) => const CheckoutItem(),
                          separatorBuilder: (context, index) => SizedBox(height: 10.h),
                          itemCount: 5,
                          shrinkWrap: true,

                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 100.h),
                Container(
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.fieldColor,
                    borderRadius: BorderRadius.circular(15).r,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 70.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '422.50 EGP',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
