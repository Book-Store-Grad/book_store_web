import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../business_logic/home/home_cubit.dart';
import '../../../core/utils/asset_imgaes.dart';
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
                    SizedBox(height: 100.h),
                    HomeSection(
                      label: 'Business',
                      scrollKey: cubit.businessKey,
                      books: cubit.books,
                    ),
                    SizedBox(height: 100.h),
                    HomeSection(
                      label: 'Classic',
                      scrollKey: cubit.classicKey,
                      books: cubit.books,
                    ),
                    SizedBox(height: 100.h),
                    HomeSection(
                      label: 'Technology',
                      scrollKey: cubit.technologyKey,
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
