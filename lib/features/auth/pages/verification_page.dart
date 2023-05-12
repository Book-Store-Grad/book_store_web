import 'package:book_store_web/business_logic/login/login_cubit.dart';
import 'package:book_store_web/features/auth/pages/reset_password_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../shared/widgets/default_button.dart';
import '../../../shared/widgets/footer.dart';
import '../../../styles/app_colors.dart';
import '../widgets/auth_app_bar.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({Key? key}) : super(key: key);

  static const String routeName = '/verification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is VerifyCodeSuccessState) {
            context.go(ResetPasswordPage.routeName);
          }
        },
        builder: (context, state) {
          LoginCubit cubit = BlocProvider.of<LoginCubit>(context, listen: false);

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Verification',
                  style: TextStyle(
                    fontSize: 38.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 35.h),
                SizedBox(
                  width: 450.w,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Verification Code',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      OTPTextField(
                        length: 4,
                        width: 350.w,
                        fieldWidth: 65.w,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldStyle: FieldStyle.box,
                        otpFieldStyle: OtpFieldStyle(
                          focusBorderColor: AppColors.primary,
                        ),
                        onCompleted: (pin) {
                          cubit.checkOTP(oTP: pin.toString());
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                state is VerifyCodeLoadingState ? const CircularProgressIndicator() :  DefaultButton(
                  onPressed: () {},
                  height: 56.h,
                  width: 300.w,
                  text: 'Verify',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

