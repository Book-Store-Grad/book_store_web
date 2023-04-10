import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/auth_app_bar.dart';
import '../../../shared/widgets/default_button.dart';
import '../../../shared/widgets/footer.dart';
import '../widgets/auth_form_field.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  static const String routeName = '/forgot-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar(),
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
            const AuthFormField(
              label: 'Email',
              hint: 'Enter your E-mail',
            ),
            SizedBox(height: 65.h),
            DefaultButton(
              onPressed: () {},
              height: 56.h,
              width: 300.w,
              text: 'Send Code',
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
