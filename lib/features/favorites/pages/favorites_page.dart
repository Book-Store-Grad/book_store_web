import 'package:book_store_web/business_logic/favourite/favourite_cubit.dart';
import 'package:book_store_web/features/favorites/widgets/favorite_item.dart';
import 'package:book_store_web/features/favorites/widgets/favourite_skeleton.dart';
import 'package:book_store_web/shared/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/widgets/footer.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  static const String routeName = '/favorites';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      FavouriteCubit()
        ..getAllFavItems(),
      child: BlocConsumer<FavouriteCubit, FavouriteState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = BlocProvider.of<FavouriteCubit>(context);
          return Scaffold(
            appBar: appBar(context, isAuthor: false),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 125.w, vertical: 40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Favorites',
                      style: TextStyle(
                        fontSize: 35.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: Column(
                        children: [
                          SizedBox(height: 45.h),
                          ListView.separated(
                            itemBuilder: (context, index) =>
                            state is GetAllFavouriteLoading
                                ? const FavSkeleton()
                                :  FavoriteItem(
                              favId: cubit.favItems[index].favId,
                              bookId: cubit.favItems[index].bookId,
                            ),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 30.h),
                            itemCount: state is GetAllFavouriteLoading
                            ?5
                            :cubit.favItems.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: const Footer(),
          );
        },
      ),
    );
  }
}
