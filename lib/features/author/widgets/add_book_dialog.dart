import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/widgets/default_text_form_field.dart';
import '../../../styles/app_colors.dart';

class AddBookDialog extends StatelessWidget {
  const AddBookDialog({
    super.key,
    required this.onSubmit,
  });

  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Item1',
      'Item2',
      'Item3',
      'Item4',
    ];

    return AlertDialog(
      title: Text(
        'Add a book',
        style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
      content: SizedBox(
        height: 480.h,
        width: 515.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const DefaultTextFormField(
              label: 'Name',
              hint: 'Name',
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10.h),
                DropdownButtonFormField2(
                  items: items
                      .map(
                        (item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20.h,
                      horizontal: 10.w,
                    ),
                    filled: true,
                    fillColor: AppColors.fieldColor,
                    hintText: 'Select Category',
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
                    errorStyle: TextStyle(fontSize: 11.5.sp),
                  ),
                ),
              ],
            ),
            const DefaultTextFormField(
              label: 'Price',
              hint: 'Price',
            ),
            const DefaultTextFormField(
              label: 'Description',
              hint: 'Description',
              maxLines: 4,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: MaterialButton(
                onPressed: onSubmit,
                color: AppColors.blueButtonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                height: 50.h,
                minWidth: 135.w,
                padding: EdgeInsets.zero,
                child: Text(
                  'Add',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
