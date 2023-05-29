import 'package:book_store_web/shared/widgets/app_bar.dart';
import 'package:book_store_web/styles/app_colors.dart';
import 'package:book_store_web/styles/app_colors.dart';
import 'package:book_store_web/styles/app_colors.dart';
import 'package:book_store_web/styles/app_colors.dart';
import 'package:book_store_web/styles/app_colors.dart';
import 'package:book_store_web/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  static const String routeName = '/about-us';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, isAuthor: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40).r,
          child: Column(
            children: [
              Text(
                'About Us',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 38.sp,
                ),
              ),
              SizedBox(height: 40.h),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 600.w,
                  child: Text(
                    'We are some young people who created a website to benefit other young people with good books.\nReading is one of the best things a man can do, so if you aren\'t a reader, become one and start with us.',
                    style: TextStyle(
                      fontSize: 30.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 190.h),
              SizedBox(
                width: 250.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(icon:  const Icon(FontAwesomeIcons.facebook, color: AppColors.primary), onPressed: () {},),
                    IconButton(icon: const Icon(FontAwesomeIcons.twitter, color: AppColors.primary), onPressed: () {},),
                    IconButton(icon: const Icon(FontAwesomeIcons.youtube, color: AppColors.primary), onPressed: () {},),
                    IconButton(icon: const Icon(FontAwesomeIcons.linkedin, color: AppColors.primary), onPressed: () {},),
                    IconButton(icon: const Icon(FontAwesomeIcons.github, color: AppColors.primary), onPressed: () {},),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
