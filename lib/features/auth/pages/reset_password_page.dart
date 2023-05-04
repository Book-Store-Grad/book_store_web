import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/auth_app_bar.dart';
import '../../../shared/widgets/default_button.dart';
import '../../../shared/widgets/footer.dart';
import '../../../shared/widgets/default_text_form_field.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  static const String routeName = '/reset-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar(context),
      body: Center(
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
            const DefaultTextFormField(
              label: 'New Password',
              hint: 'Enter a new password',
            ),
            SizedBox(height: 65.h),
            DefaultButton(
              onPressed: () {},
              height: 56.h,
              width: 300.w,
              text: 'Reset',
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
