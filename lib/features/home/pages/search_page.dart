import 'package:book_store_web/features/home/widgets/search_section.dart';
import 'package:book_store_web/shared/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/search_item.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  static const String routeName = '/search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, isAuthor: false),
      body: Padding(
        padding: const EdgeInsets.all(15.0).r,
        child: Column(
          children: [
            SearchSection(searchController: TextEditingController()),
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 150.h, vertical: 25.h),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 20.h,
                  childAspectRatio: 0.74.w / 1.13.h,
                  crossAxisCount: 4,
                  crossAxisSpacing: 10.w,
                ),
                itemBuilder: (context, index) => const SearchItem(),
                itemCount: 25,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}