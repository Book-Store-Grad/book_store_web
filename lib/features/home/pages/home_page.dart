import 'package:book_store_web/core/utils/asset_imgaes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../business_logic/home/home_cubit.dart';
import '../../../shared/widgets/app_bar.dart';
import '../../../shared/widgets/footer.dart';
import '../widgets/home_section.dart';
import '../widgets/search_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = BlocProvider.of<HomeCubit>(context, listen: false);
    return Scaffold(
      appBar: appBar(context, isAuthor: false),
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
                Image.asset(
                  AssetImages.homeCover,
                  height: 500.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Column(
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
