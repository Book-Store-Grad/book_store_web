import 'package:book_store_web/business_logic/cart/cart_cubit.dart';
import 'package:book_store_web/features/cart/widgets/cart_skeleton.dart';
import 'package:book_store_web/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/widgets/footer.dart';
import '../../../styles/app_colors.dart';
import '../../../shared/widgets/app_bar.dart';
import '../widgets/cart_item.dart';
import 'checkout_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  static const String routeName = '/cart';

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void getAllCart() async {
    await BlocProvider.of<CartCubit>(context).getAllCartItems();
  }

  @override
  void initState() {
    getAllCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Cart> cartItems = BlocProvider.of<CartCubit>(context).cartItems;
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
                    color: AppColors.blueButtonColor,
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
                    BlocConsumer<CartCubit, CartState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is GetAllCartSuccess) {
                          cartItems.clear();
                          for (Cart cartItem in state.cartItems!) {
                            cartItems.add(cartItem);
                            if (state.cartItems!.indexOf(cartItem) == state.cartItems!.length - 1 ) {
                              BlocProvider.of<CartCubit>(context).refreshPage();
                            }
                          }
                        }
                        return ListView.separated(
                          itemBuilder: (context, index) => cartItems.isEmpty
                              ? const CartSkeleton()
                              : CartItem(
                                  bookId: cartItems[index].bookId!,
                                  bookName: cartItems[index].bookName!,
                                  bookDescription:
                                      cartItems[index].bookDescription!,
                                ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 30.h),
                          itemCount: cartItems.isEmpty ? 5 : cartItems.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                        );
                      },
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
