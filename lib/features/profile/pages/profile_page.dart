import 'package:book_store_web/business_logic/profile/profile_cubit.dart';
import 'package:book_store_web/core/constants/api_constants.dart';
import 'package:book_store_web/core/constants/app_constants.dart';
import 'package:book_store_web/shared/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {

  const ProfilePage({Key? key}) : super(key: key);

  static const String routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
          return  Scaffold(
                appBar: appBar(context, isAuthor: false),
                body: SingleChildScrollView(
                  child: ListView(padding: EdgeInsets.all(15), children: [
                    Column(
                      children: [
                        Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 35.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        state is GetProfileImageLoadingState
                            ? Center(child: CircularProgressIndicator())
                            : InkWell(
                                onTap: () async {
                                  await cubit.chooseImage();
                                },
                                child: Card(
                                  shape: CircleBorder(),
                                  elevation: 10,
                                  shadowColor: Colors.blue,
                                  child: Container(
                                    width: 120.w,
                                    height: 120.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: cubit.image != null
                                        ? Card(
                                            clipBehavior: Clip.antiAlias,
                                            shape: CircleBorder(),
                                            elevation: 10,
                                            child: Image.file(
                                              cubit.image!,
                                              fit: BoxFit.contain,
                                            ),
                                          )
                                        : Card(
                                            shape: CircleBorder(),
                                            clipBehavior: Clip.antiAlias,
                                            child: Image.network(
                                                ApiConstants.profileImage,
                                                fit: BoxFit.contain,
                                                headers: {
                                                  "Authorization":
                                                      "Bearer $token",
                                                }),
                                          ),
                                  ),
                                ),
                              ),
                        state is UpdateProfileImageLoadingState
                            ? CircularProgressIndicator()
                            : cubit.image == null
                            ? SizedBox()
                            : TextButton(
                            onPressed: () {
                              cubit.updateProfileImage();
                            },
                            child: Text("Upload")),
                      ],
                    )
                  ]),
                ),
              );
      },
    );
  }
}
