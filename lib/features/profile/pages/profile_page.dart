import 'package:book_store_web/business_logic/profile/profile_cubit.dart';
import 'package:book_store_web/core/constants/api_constants.dart';
import 'package:book_store_web/core/constants/app_constants.dart';
import 'package:book_store_web/shared/widgets/app_bar.dart';
import 'package:book_store_web/shared/widgets/default_button.dart';
import 'package:book_store_web/shared/widgets/default_text_form_field.dart';
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
        return Scaffold(
          appBar: appBar(context, isAuthor: false),
          body: SingleChildScrollView(
            child: ListView(
                padding: const EdgeInsets.all(15),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 50),
                        child: Text(
                          'My Profile',
                          style: TextStyle(
                            fontSize: 35.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      state is GetProfileImageLoadingState
                          ? const Center(child: CircularProgressIndicator())
                          : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () async {
                              await cubit.chooseImage();
                            },
                            child: Card(
                              shape: const CircleBorder(),
                              elevation: 10,
                              shadowColor: Colors.blue,
                              child: Container(
                                width: 230.w,
                                height: 230.h,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: cubit.image != null
                                    ? Card(
                                  clipBehavior: Clip.antiAlias,
                                  shape: const CircleBorder(),
                                  elevation: 10,
                                  child: Image.memory(
                                    cubit.webImage,
                                    fit: BoxFit.contain,
                                  ),
                                )
                                    : Card(
                                  shape: const CircleBorder(),
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
                              ? const CircularProgressIndicator()
                              : cubit.image == null
                              ? const SizedBox()
                              : TextButton(
                              onPressed: () {
                                cubit.updateProfileImage();
                              },
                              child: const Text("Upload")),
                          SizedBox(width: 50),
                          Column(
                            children: [
                              DefaultTextFormField(
                                enabled: false,
                                label: 'Email',
                                hint: '',
                                controller: cubit.emailController,
                              ),
                              SizedBox(height: 25.h),
                              DefaultTextFormField(
                                label: 'Name',
                                hint: '',
                                controller: cubit.nameController,
                                //onChanged: (email) => cubit.loginSchema.email = email,
                              ),
                              SizedBox(height: 25.h),
                              DefaultTextFormField(
                                enabled: false,
                                label: 'Gender',
                                hint: '',
                                controller: cubit.genderController,

                                //onChanged: (email) => cubit.loginSchema.email = email,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20.h),
                      state is UpdateProfileLoadingState
                          ? const CircularProgressIndicator()
                          : DefaultButton(
                        onPressed: () {

                          cubit.updateProfile(name: cubit.nameController.text);
                          print("save pressed");
                        },
                        text: "Save",
                        height: 56.h,
                        width: 300.w,
                      )
                    ],
                  )
                ]),
          ),
        );
      },
    );
  }
}
