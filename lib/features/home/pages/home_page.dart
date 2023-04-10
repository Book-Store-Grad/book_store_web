import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../business_logic/global_cubit/global_cubit.dart';
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
    GlobalCubit globalCubit =
    BlocProvider.of<GlobalCubit>(context, listen: false);
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        controller: globalCubit.scrollController,
        child: BlocConsumer<GlobalCubit, GlobalState>(
          listener: (context, state) {},
          builder: (context, state) {
            TextEditingController searchController = BlocProvider.of<GlobalCubit>(context).searchController;
            return Column(
              children: [
                SearchSection(searchController: searchController, onChanged: (_) => globalCubit.onSearchTextChanged(),),
                AnimatedConditionalBuilder(
                  condition: false,
                  builder:(context) =>  Column(
                    children: [
                      HomeSection(
                        label: 'Recommended For You',
                        scrollKey: globalCubit.homeKey,
                      ),
                      SizedBox(height: 25.h),
                      HomeSection(
                        label: 'Linguistics',
                        scrollKey: globalCubit.linguisticsKey,
                      ),
                      SizedBox(height: 25.h),
                      HomeSection(
                        label: 'Self-Development',
                        scrollKey: globalCubit.selfDevelopmentKey,
                      ),
                      SizedBox(height: 25.h),
                      HomeSection(
                        label: 'Technologies',
                        scrollKey: globalCubit.technologiesKey,
                      ),
                    ],
                  ),
                  fallback: (context) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 125.h, vertical: 35.h),
                    child: GridView.builder(
                      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 0.75.w/1.13.h,
                        crossAxisSpacing: 20.w,
                        mainAxisSpacing: 20.h,
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
                SizedBox(height: 25.h),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
