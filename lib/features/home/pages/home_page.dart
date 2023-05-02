import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../business_logic/home/home_cubit.dart';
import '../../../shared/widgets/footer.dart';
import '../widgets/app_bar.dart';
import '../widgets/home_section.dart';
import '../widgets/search_item.dart';
import '../widgets/search_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = BlocProvider.of<HomeCubit>(context, listen: false);
    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        controller: cubit.scrollController,
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                SearchSection(
                  searchController: cubit.searchController,
                  onChanged: (_) => cubit.onSearchTextChanged(),
                ),
                AnimatedConditionalBuilder(
                  condition: cubit.searchController.text == '',
                  builder: (context) => Column(
                    children: [
                      HomeSection(
                        label: 'Recommended For You',
                        scrollKey: cubit.homeKey,
                        books: cubit.books,
                      ),
                      SizedBox(height: 25.h),
                      HomeSection(
                        label: 'Linguistics',
                        scrollKey: cubit.linguisticsKey,
                        books: cubit.books,
                      ),
                      SizedBox(height: 25.h),
                      HomeSection(
                        label: 'Self-Development',
                        scrollKey: cubit.selfDevelopmentKey,
                        books: cubit.books,
                      ),
                      SizedBox(height: 25.h),
                      HomeSection(
                        label: 'Technologies',
                        scrollKey: cubit.technologiesKey,
                        books: cubit.books,
                      ),
                    ],
                  ),
                  fallback: (context) => Padding(
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
                  duration: const Duration(milliseconds: 850),
                  reverseDuration: const Duration(milliseconds: 850),
                  switchInCurve: Curves.easeInOut,
                  switchOutCurve: Curves.easeInOut,
                ),
                SizedBox(height: 20.h),
                const Footer(),
              ],
            );
          },
        ),
      ),
    );
  }
}
