import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletons/skeletons.dart';

class DefaultSkeleton extends StatelessWidget {
  final double height;
  final double width;
  final double? borderRadius;

  const DefaultSkeleton({
    super.key,
    required this.height,
    required this.width,
    this.borderRadius = 6,
  });

  @override
  Widget build(BuildContext context) {
    return SkeletonAvatar(
      style: SkeletonAvatarStyle(
        height: height,
        width: width,
        borderRadius: BorderRadius.circular(borderRadius!).r,
      ),
    );
  }
}
