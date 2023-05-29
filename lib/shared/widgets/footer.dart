import 'package:book_store_web/shared/pages/about_us_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../styles/app_colors.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      color: AppColors.footerColor,
      padding: const EdgeInsets.symmetric(horizontal: 75).w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => context.go(AboutUsPage.routeName),
            child: Text(
              'About Us',
              style: TextStyle(
                fontSize: 14.5.sp,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 225.w,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(FontAwesomeIcons.facebook, color: Colors.white),
                Icon(FontAwesomeIcons.twitter, color: Colors.white),
                Icon(FontAwesomeIcons.youtube, color: Colors.white),
                Icon(FontAwesomeIcons.linkedin, color: Colors.white),
                Icon(FontAwesomeIcons.instagram, color: Colors.white),
                Icon(FontAwesomeIcons.github, color: Colors.white),
              ],
            ),
          ),
          Text(
            'Book Store - Copyright \u00a9 2023',
            style: TextStyle(
              fontSize: 14.5.sp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
