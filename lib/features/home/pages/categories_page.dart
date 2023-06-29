import 'dart:ui';

import 'package:book_store_web/core/constants/app_constants.dart';
import 'package:book_store_web/features/home/pages/category_page.dart';
import 'package:book_store_web/shared/widgets/app_bar.dart';
import 'package:book_store_web/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  static const String routeName = '/categories';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, isAuthor: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 250.w, vertical: 50.h),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.7 / 1,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.h,
          ),
          itemBuilder: (context, index) => CategoryItem(
              categoryName: kCategoriesList[index],
              categoryImageUrl: kCategoriesImagesList[index]),
          itemCount: 9,
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categoryName,
    required this.categoryImageUrl,
  });

  final String categoryName;
  final String categoryImageUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          context.goNamed(
            CategoryPage.name,
            params: {'categoryName': categoryName.toLowerCase()},
          );
        },
        child: SizedBox(
          height: 170,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(categoryImageUrl, fit: BoxFit.cover),
              ClipRRect(
                // Clip it cleanly.
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(
                    color: Colors.grey.withOpacity(0.1),
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Text(
                        categoryName,
                        style: TextStyle(
                          fontFamily: 'DMMono',
                          fontWeight: FontWeight.w700,
                          fontSize: 28.sp,
                          color: AppColors.primary,
                          backgroundColor: Colors.white54,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
