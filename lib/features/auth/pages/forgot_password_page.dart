import 'package:book_store_web/business_logic/login/login_cubit.dart';
import 'package:book_store_web/features/auth/pages/verification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../styles/app_colors.dart';
import '../widgets/auth_app_bar.dart';
import '../../../shared/widgets/default_button.dart';
import '../../../shared/widgets/footer.dart';
import '../../../shared/widgets/default_text_form_field.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  static const String routeName = '/forgot-password';

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = BlocProvider.of<LoginCubit>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Forgot Password',
              style: TextStyle(
                fontSize: 38.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 35.h),
            DefaultTextFormField(
              label: 'Email',
              hint: 'Enter your E-mail',
              controller: cubit.forgotPasswordEmailController,
            ),
            SizedBox(height: 65.h),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is ForgotPasswordSuccessState) {
                  Future.delayed(
                    const Duration(seconds: 3),
                    () => context.go(VerificationPage.routeName),
                  );
                }
              },
              builder: (context, state) {
                return state is ForgotPasswordLoadingState
                    ? const CircularProgressIndicator()
                    : state is ForgotPasswordSuccessState
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Code sent, check your email',
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w500,
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
                              cubit.forgotPassword();
                            },
                            height: 56.h,
                            width: 300.w,
                            text: 'Send Code',
                          );
              },
            ),
          ],
        ),
      ),
    );
  }
}
