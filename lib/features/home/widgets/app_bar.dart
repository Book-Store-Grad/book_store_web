import 'package:book_store_web/features/cart/pages/cart_page.dart';
import 'package:book_store_web/features/favorites/pages/favorites_page.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/asset_imgaes.dart';
import '../../../shared/widgets/nav_bar.dart';
import '../../../styles/app_colors.dart';

PreferredSizeWidget appBar(BuildContext context, {bool? isAuthor}) => AppBar(
      toolbarHeight: 70.h,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 7,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25).w,
        child: Row(
          children: [
            InkWell(
              onTap: () => context.go('/'),
              child: Row(
                children: [
                  Image.asset(
                    AssetImages.logo,
                    height: 30.h,
                    width: 30.h,
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
            if (isAuthor == null || !isAuthor) const NavBar(),
            const Spacer(),
            Row(
              children: [
                Text(
                  'Profile',
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10.w),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    items: [
                      ...MenuItems.firstItems.map(
                        (item) => DropdownMenuItem<MenuItem>(
                          value: item,
                          child: MenuItems.buildItem(item),
                        ),
                      ),
                      const DropdownMenuItem<Divider>(
                          enabled: false, child: Divider()),
                      ...MenuItems.secondItems.map(
                        (item) => DropdownMenuItem<MenuItem>(
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
                      customHeights: [
                        ...List<double>.filled(
                          MenuItems.firstItems.length,
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
  static const List<MenuItem> firstItems = [account, cart, favorites];
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
    switch (item) {
      case MenuItems.account:
        //Do something
        break;
      case MenuItems.cart:
        context.go(CartPage.routeName);
        break;
      case MenuItems.favorites:
        context.go(FavoritesPage.routeName);
        break;
      case MenuItems.logout:
        //Do something
        break;
    }
  }
}
