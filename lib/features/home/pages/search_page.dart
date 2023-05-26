import 'package:book_store_web/business_logic/home/home_cubit.dart';
import 'package:book_store_web/features/home/widgets/search_section.dart';
import 'package:book_store_web/shared/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/search_item.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  static const String routeName = '/search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, isAuthor: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0).r,
          child: Column(
            children: [
              SearchSection(
                  searchController:
                      BlocProvider.of<HomeCubit>(context).searchController),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 150.h, vertical: 25.h),
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is SearchLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is SearchSuccess) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 20.h,
                          childAspectRatio: 0.74.w / 1.13.h,
                          crossAxisCount: 4,
                          crossAxisSpacing: 10.w,
                        ),
                        itemBuilder: (context, index) =>  SearchItem(book: state.searchedBooks[index]),
                        itemCount: state.searchedBooks.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      );
                    } else if (state is SearchEmptyState) {
                      return Center(
                        child: Text(
                          'No Books Found!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp,
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: Text(
                          'Search To Find Books',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
