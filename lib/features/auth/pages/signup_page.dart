import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../business_logic/sign_up/sign_up_cubit.dart';
import '../../../shared/widgets/default_button.dart';
import '../../../shared/widgets/footer.dart';
import '../../../styles/app_colors.dart';
import '../widgets/auth_app_bar.dart';
import '../widgets/auth_error_dialog.dart';
import '../../../shared/widgets/default_text_form_field.dart';
import 'login_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static const String routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    SignUpCubit cubit = BlocProvider.of<SignUpCubit>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: cubit.signupFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 25.h),
                DefaultTextFormField(
                  label: 'Full Name',
                  hint: 'Enter your Name',
                  onChanged: (name) => cubit.signUpSchema.name = name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Your Name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                DefaultTextFormField(
                  label: 'Email',
                  hint: 'Enter your E-mail',
                  onChanged: (email) => cubit.signUpSchema.email = email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Your Email";
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return "Please Enter a Valid Email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                BlocConsumer<SignUpCubit, SignUpState>(
                  listener: (context, state) {
                    if (state is SignUpSuccessState) {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Successfully Signed Up',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24.sp,
                                      color: const Color(0xff00A3FF),
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  TextButton(
                                    child: Text(
                                      'Click here to login',
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                    onPressed: () => context.go(LoginPage.routeName),
                                  ),
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                      );
                    }
                    if (state is SignUpFailureState) {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            AuthErrorDialog(error: state.error),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        DefaultTextFormField(
                          label: 'Password',
                          hint: 'Enter password',
                          onChanged: (password) =>
                              cubit.signUpSchema.password = password,
                          isHidden: cubit.passwordHidden,
                          suffixIcon: cubit.passwordHidden
                              ? CupertinoIcons.eye_slash
                              : CupertinoIcons.eye,
                          onSuffixPressed: () {
                            cubit.switchPassword();
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter a Password";
                            }
                            if (value.length < 6) {
                              return "Password must be at least 6 characters!";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.h),
                        DefaultTextFormField(
                          label: 'Confirm Password',
                          hint: 'Re-enter password',
                          isHidden: cubit.passwordHidden,
                          suffixIcon: cubit.passwordHidden
                              ? CupertinoIcons.eye_slash
                              : CupertinoIcons.eye,
                          onSuffixPressed: () {
                            cubit.switchPassword();
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Re-Enter Password";
                            }
                            if (value != cubit.signUpSchema.password) {
                              return "Password doesn't match";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(
                          width: 350.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DropdownButtonFormField(
                                items: ["Male", "Female"].map((String gender) {
                                  return DropdownMenuItem<String>(
                                    value: gender,
                                    child: Text(gender,
                                        style: TextStyle(fontSize: 12.sp)),
                                  );
                                }).toList(),
                                onChanged: (value) =>
                                    cubit.signUpSchema.gender = value!,
                                decoration: InputDecoration(
                                  label: Text(
                                    'Gender',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20.h, horizontal: 10.w),
                                  filled: true,
                                  fillColor: AppColors.fieldColor,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10).r,
                                    borderSide: BorderSide.none,
                                  ),
                                  constraints: BoxConstraints(
                                    maxWidth: 150.w,
                                  ),
                                  isDense: true,
                                  errorStyle: TextStyle(fontSize: 11.5.sp),
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return "Choose your gender";
                                  }
                                  return null;
                                },
                              ),
                              DropdownButtonFormField(
                                items:
                                    ["Customer", "Author"].map((String role) {
                                  return DropdownMenuItem<String>(
                                    value: role,
                                    child: Text(role,
                                        style: TextStyle(fontSize: 12.sp)),
                                  );
                                }).toList(),
                                onChanged: (value) =>
                                    cubit.signUpSchema.role = value!.toLowerCase(),
                                decoration: InputDecoration(
                                  label: Text(
                                    'Role',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20.h, horizontal: 10.w),
                                  filled: true,
                                  fillColor: AppColors.fieldColor,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10).r,
                                    borderSide: BorderSide.none,
                                  ),
                                  constraints: BoxConstraints(
                                    maxWidth: 150.w,
                                  ),
                                  isDense: true,
                                  errorStyle: TextStyle(fontSize: 11.5.sp),
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return "Choose your account role!";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 23.h),
                        state is SignUpLoadingState
                            ? const CircularProgressIndicator()
                            : DefaultButton(
                                onPressed: () {
                                  if (cubit.signupFormKey.currentState!
                                      .validate()) {
                                    cubit.signUpUser();
                                  }
                                },
                                height: 56.h,
                                width: 300.w,
                                text: 'Sign Up',
                              ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 14.h),
                SizedBox(
                  width: 350.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.go(LoginPage.routeName);
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
