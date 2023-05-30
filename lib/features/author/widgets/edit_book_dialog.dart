import 'package:book_store_web/models/book.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../business_logic/author/author_cubit.dart';
import '../../../core/constants/app_constants.dart';
import '../../../shared/widgets/default_text_form_field.dart';
import '../../../styles/app_colors.dart';
import 'add_image_dialog.dart';

class EditBookDialog extends StatelessWidget {
  final Book book;

  const EditBookDialog({
    super.key, required this.book,
  });

  @override
  Widget build(BuildContext context) {
    AuthorCubit cubit = BlocProvider.of<AuthorCubit>(context);

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
        height: 590.h,
        width: 500.w,
        child: Form(
          key: cubit.editBookFormKey,
          child: Transform.translate(
            offset: Offset(20.w, 0.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextFormField(
                  label: 'Name',
                  hint: 'Name',
                  controller: cubit.editBookNameController,
                  // initialValue: book.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter book name";
                    }
                    return null;
                  },
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
                      items: kCategoriesList
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
                      onChanged: (category) =>
                          cubit.editBookCategoryController.text = category!,
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
                      validator: (value) {
                        if (value == null) {
                          return "Please select category";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                DefaultTextFormField(
                  label: 'Price',
                  hint: 'Price',
                  controller: cubit.editBookPriceController,
                  // initialValue: book.price.toString(),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter book price";
                    }
                    return null;
                  },
                  // onChanged: (price) => cubit.bookSchema.price = price,
                ),
                DefaultTextFormField(
                  label: 'Description',
                  hint: 'Description',
                  maxLines: 4,
                  controller: cubit.editBookDescriptionController,
                  // onChanged: (description) =>
                  //     cubit.bookSchema.description = description,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter description";
                    }
                    return null;
                  },
                ),
                BlocConsumer<AuthorCubit, AuthorState>(
                  listener: (context, state) {
                    if (state is EditBookSuccess) {
                      context.pop();
                      showDialog(
                        context: context,
                        builder: (context) => const AddImage(),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Transform.translate(
                      offset: Offset(-20.w, 0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: state is AddBookLoadingState
                            ? const CircularProgressIndicator()
                            : state is AddBookSuccessState
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        CupertinoIcons.checkmark_rectangle,
                                        size: 29.r,
                                        color: AppColors.green,
                                      ),
                                      SizedBox(width: 8.w),
                                      Text(
                                        'Successfully added',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ],
                                  )
                                : MaterialButton(
                                    onPressed: () {
                                      if (cubit.editBookFormKey.currentState!
                                          .validate()) {
                                        cubit.editBook(bookId: book.id!);
                                      } else {}
                                    },
                                    color: AppColors.blueButtonColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    height: 50.h,
                                    minWidth: 135.w,
                                    padding: EdgeInsets.zero,
                                    child: Text(
                                      'Edit',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
