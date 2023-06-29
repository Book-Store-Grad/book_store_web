import 'package:book_store_web/core/utils/string_capitalize.dart';
import 'package:book_store_web/models/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../business_logic/home/home_cubit.dart';
import '../../../shared/widgets/app_bar.dart';
import '../widgets/search_item.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({
    Key? key,
    this.categoryName,
  }) : super(key: key);

  final String? categoryName;
  static const String name = 'category';
  static const String routeName = '/category/:categoryName';

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).getCategoryBook(widget.categoryName!);
    super.initState();
  }

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
                  '${widget.categoryName!.capitalize()} books',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp,
                      fontFamily: 'DMMono'),
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
                  if (state is SearchLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GetCategoryBooksSuccessState) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 20.h,
                        childAspectRatio: 0.74.w / 1.13.h,
                        crossAxisCount: 4,
                        crossAxisSpacing: 10.w,
                      ),
                      itemBuilder: (context, index) =>
                          SearchItem(book: state.categoryBooks[index]),
                      itemCount: state.categoryBooks.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    );
                  } else if (state is GetCategoryBooksEmptyState) {
                    return Center(
                      child: Text(
                        'There are no books available in ${widget.categoryName!.capitalize()}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.sp,
                      ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
