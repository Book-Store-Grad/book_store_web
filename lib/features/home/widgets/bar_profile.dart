import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BarProfile extends StatefulWidget {
  const BarProfile({
    super.key,
  });

  @override
  State<BarProfile> createState() => _BarProfileState();
}

class _BarProfileState extends State<BarProfile> {
  bool isMenuShown = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Profile',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 10.w,
        ),
        InkWell(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          mouseCursor: SystemMouseCursors.text,
          onTap: () {
            setState(() {
              isMenuShown = !isMenuShown;
            });
          },
          child: const Chip(
            label: Icon(Icons.keyboard_arrow_down),
            avatar: Icon(Icons.person),
            labelPadding: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }
}
