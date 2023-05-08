import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/app_colors.dart';

class DefaultTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final FormFieldSetter? onSaved;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator? validator;
  final bool? isHidden;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixPressed;
  final int? maxLines;
  final ValueChanged<String>? onFieldSubmitted;

  const DefaultTextFormField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.isHidden = false,
    this.onSuffixPressed,
    this.suffixIcon,
    this.maxLines =1 ,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10.h),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
            filled: true,
            fillColor: AppColors.fieldColor,
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.hintTextColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10).r,
              borderSide: BorderSide.none,
            ),
            constraints: BoxConstraints(
              maxWidth: 350.w,
            ),
            isDense: true,
            suffixIcon: InkWell(
              onTap: onSuffixPressed,
              child: Icon(
                suffixIcon,
                size: 20.r,
              ),
            ),
            errorStyle: TextStyle(fontSize: 11.5.sp),
          ),
          textAlignVertical: TextAlignVertical.center,
          onSaved: onSaved,
          onChanged: onChanged,
          validator: validator,
          obscureText: isHidden!,
          maxLines: maxLines,
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}
