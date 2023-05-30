import 'package:book_store_web/business_logic/login/login_cubit.dart';
import 'package:book_store_web/features/auth/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../styles/app_colors.dart';
import '../../../shared/widgets/default_button.dart';
import '../../../shared/widgets/default_text_form_field.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  static const String routeName = '/reset-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          LoginCubit cubit = BlocProvider.of<LoginCubit>(context, listen: false);
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 38.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 35.h),
                DefaultTextFormField(
                  label: 'New Password',
                  hint: 'Enter a new password',
                  controller: cubit.newPasswordController,
                  isHidden: cubit.passwordHidden,
                  suffixIcon: cubit.passwordHidden ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                  onSuffixPressed: () {
                    cubit.switchPassword();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Your Password";
                    }
                    if (value!.length < 6) {
                      return "Please Enter strong password";
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) {
                    if (cubit.loginFormKey.currentState!.validate()) {
                      cubit.resetPassword();
                    }
                  },
                ),
                SizedBox(height: 65.h),
                state is ResetPasswordLoadingState
                    ? const CircularProgressIndicator()
                    : state is ResetPasswordSuccessState
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Password has been reset',
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.go(LoginPage.routeName);
                                },
                                child: Text(
                                  'Click here to login',
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.sp),
                              Icon(
                                Icons.check_circle,
                                color: AppColors.green,
                                size: 27.sp,
                              ),
                            ],
                          )
                        : DefaultButton(
                            onPressed: () {
                              if (cubit.loginFormKey.currentState!.validate()) {
                                cubit.resetPassword();
                              }
                            },
                            height: 56.h,
                            width: 300.w,
                            text: 'Reset',
                          ),
              ],
            ),
          );
        },
      ),
    );
  }
}
