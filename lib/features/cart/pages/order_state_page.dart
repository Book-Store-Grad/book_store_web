import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/widgets/footer.dart';
import '../../../shared/widgets/app_bar.dart';

class OrderStatePage extends StatelessWidget {
  const OrderStatePage({Key? key}) : super(key: key);

  static const String routeName = '/order-state';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, isAuthor: false),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.15.sh),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Order Status',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45.sp,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15).r,
                  child: Icon(
                    CupertinoIcons.check_mark_circled,
                    size: 230.r,
                    color: const Color(0xff4CBE24),
                  ),
                ),
                Text(
                  'Your order was successful',
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Click here to view your order',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
