import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../business_logic/home/home_cubit.dart';
import '../../../shared/widgets/app_bar.dart';
import '../widgets/search_item.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key, this.categoryName}) : super(key: key);

  final String? categoryName;
  static const String name = 'category';
  static const String routeName = '/category/:categoryName';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, isAuthor: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150).w,
                child: Text(
                  '$categoryName books',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp,
                    fontFamily: 'DMMono'
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 150.w,
                  vertical: 25.h,
                ),
                child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                  HomeCubit cubit = BlocProvider.of<HomeCubit>(context);
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 20.h,
                      childAspectRatio: 0.74.w / 1.13.h,
                      crossAxisCount: 4,
                      crossAxisSpacing: 10.w,
                    ),
                    itemBuilder: (context, index) =>
                        SearchItem(book: cubit.books[index]),
                    itemCount: cubit.books.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
