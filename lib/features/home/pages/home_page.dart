import 'package:book_store_web/business_logic/global_cubit/global_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/widgets/footer.dart';
import '../widgets/app_bar.dart';
import '../widgets/home_section.dart';
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
        child: Column(
          children: [
            const SearchSection(),
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
            SizedBox(height: 25.h),
          ],
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
