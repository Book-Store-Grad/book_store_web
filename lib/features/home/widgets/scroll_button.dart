import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScrollButton extends StatelessWidget {
  final bool isLeft;
  final VoidCallback onPressed;

  const ScrollButton({
    super.key,
    required this.isLeft,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 21.r,
          child: Icon(
            isLeft
                ? CupertinoIcons.left_chevron
                : CupertinoIcons.right_chevron,
            color: const Color(0xff33363F),
            size: 20.r,
          ),
        ),
      ),
    );
  }
}
