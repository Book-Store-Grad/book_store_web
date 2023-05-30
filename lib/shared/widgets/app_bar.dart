import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../business_logic/login/login_cubit.dart';
import '../../core/utils/asset_imgaes.dart';
import '../../features/auth/pages/login_page.dart';
import '../../features/cart/pages/cart_page.dart';
import '../../features/favorites/pages/favorites_page.dart';
import '../../features/profile/pages/profile_page.dart';
import '../../styles/app_colors.dart';
import 'nav_bar.dart';

PreferredSizeWidget appBar(BuildContext context, {required bool isAuthor}) =>
    AppBar(
      toolbarHeight: 70.h,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 7,
      title: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LogoutState) {
            context.go(LoginPage.routeName);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25).w,
            child: Row(
              children: [
                InkWell(
                  onTap: () => context.go('/'),
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Row(
                    children: [
                      Image.asset(
                        AssetImages.logo,
                        height: 32.5.h,
                        width: 32.5.w,
                      ),
                      SizedBox(width: 15.w),
                      Text(
                        'Bookstore',
                        style: TextStyle(
                          fontFamily: 'DMMono',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                if (!isAuthor) const NavBar(),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      'Profile',
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10.w),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        items: isAuthor
                            ? [
                          ...MenuItems.firstAuthorItems.map(
                                (item) =>
                                DropdownMenuItem<MenuItem>(
                                  value: item,
                                  child: MenuItems.buildItem(item),
                                ),
                          ),
                          const DropdownMenuItem<Divider>(
                              enabled: false, child: Divider()),
                          ...MenuItems.secondItems.map(
                                (item) =>
                                DropdownMenuItem<MenuItem>(
                                  value: item,
                                  child: MenuItems.buildItem(item),
                                ),
                          ),
                        ]
                            : [
                          ...MenuItems.firstCustomerItems.map(
                                (item) =>
                                DropdownMenuItem<MenuItem>(
                                  value: item,
                                  child: MenuItems.buildItem(item),
                                ),
                          ),
                          const DropdownMenuItem<Divider>(
                              enabled: false, child: Divider()),
                          ...MenuItems.secondItems.map(
                                (item) =>
                                DropdownMenuItem<MenuItem>(
                                  value: item,
                                  child: MenuItems.buildItem(item),
                                ),
                          ),
                        ],
                        onChanged: (value) {
                          MenuItems.onChanged(context, value as MenuItem);
                        },
                        dropdownStyleData: DropdownStyleData(
                          width: 165.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13.r),
                          ),
                          elevation: 6,
                          offset: Offset(30.w, -10.h),
                        ),
                        menuItemStyleData: MenuItemStyleData(
                          customHeights: isAuthor
                              ? [
                            ...List<double>.filled(
                              MenuItems.firstAuthorItems.length,
                              40.h,
                            ),
                            6.h,
                            ...List<double>.filled(
                              MenuItems.secondItems.length,
                              40.h,
                            ),
                          ]
                              : [
                            ...List<double>.filled(
                              MenuItems.firstCustomerItems.length,
                              40.h,
                            ),
                            6.h,
                            ...List<double>.filled(
                              MenuItems.secondItems.length,
                              40.h,
                            ),
                          ],
                        ),
                        customButton: const Chip(
                          label: Icon(Icons.keyboard_arrow_down),
                          avatar: Icon(Icons.person),
                          labelPadding: EdgeInsets.zero,
                        ),
                        buttonStyleData: ButtonStyleData(
                          decoration: BoxDecoration(
                            color: const Color(0xffD9D9D9),
                            borderRadius: BorderRadius.circular(35.r),
                          ),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static List<MenuItem> firstCustomerItems = [account, cart, favorites];
  static List<MenuItem> firstAuthorItems = [account];

  static const List<MenuItem> secondItems = [logout];

  static const account = MenuItem(
    text: 'Your Account',
    icon: Icons.account_circle,
  );
  static const cart = MenuItem(text: 'Cart', icon: Icons.shopping_cart);
  static const favorites = MenuItem(text: 'Favorites', icon: Icons.favorite);
  static const logout = MenuItem(text: 'Logout', icon: Icons.logout);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: AppColors.primary, size: 21.r),
        SizedBox(
          width: 8.w,
        ),
        Text(
          item.text,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, MenuItem item) {
    LoginCubit loginCubit = BlocProvider.of<LoginCubit>(context);

    switch (item) {
      case MenuItems.account:
        context.go(ProfilePage.routeName);
        break;
      case MenuItems.cart:
        context.go(CartPage.routeName);
        break;
      case MenuItems.favorites:
        context.go(FavoritesPage.routeName);
        break;
      case MenuItems.logout:
        loginCubit.logoutUser();
        break;
    }
  }
}
