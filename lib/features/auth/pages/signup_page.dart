import 'package:book_store_web/features/auth/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../widgets/auth_app_bar.dart';
import '../../../shared/widgets/default_button.dart';
import '../../../shared/widgets/footer.dart';
import '../widgets/auth_form_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static const String routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 38.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.h),
              const AuthFormField(
                label: 'Full Name',
                hint: 'Enter your Name',
              ),
              SizedBox(height: 25.h),
              const AuthFormField(
                label: 'Email',
                hint: 'Enter your E-mail',
              ),
              SizedBox(height: 25.h),
              const AuthFormField(
                label: 'Password',
                hint: 'Enter your password',
              ),
              SizedBox(height: 25.h),
              const AuthFormField(
                label: 'Confirm Password',
                hint: 'Re-enter your password',
              ),
              SizedBox(height: 28.h),
              DefaultButton(
                onPressed: () {},
                height: 56.h,
                width: 300.w,
                text: 'Sign Up',
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
      bottomNavigationBar: const Footer(),
    );
  }
}
