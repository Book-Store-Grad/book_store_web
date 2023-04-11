import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/widgets/default_button.dart';
import '../../../shared/widgets/footer.dart';
import '../widgets/auth_app_bar.dart';
import '../widgets/verification_box.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({Key? key}) : super(key: key);

  static const String routeName = '/verification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar(context),
      body: Center(
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
              width: 350.w,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Verification Code',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Re-send Code',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff3669C9),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const VerificationBox(num: 5),
                      SizedBox(width: 8.w),
                      const VerificationBox(num: 5),
                      SizedBox(width: 8.w),
                      const VerificationBox(num: 5),
                      SizedBox(width: 8.w),
                      const VerificationBox(num: 5),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 65.h),
            DefaultButton(
              onPressed: () {},
              height: 56.h,
              width: 300.w,
              text: 'Verify',
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}

