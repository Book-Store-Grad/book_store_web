import 'package:book_store_web/features/author/widgets/add_file_dialog.dart';
import 'package:book_store_web/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../business_logic/author/author_cubit.dart';

class AddImage extends StatelessWidget {
  const AddImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthorCubit cubit = BlocProvider.of<AuthorCubit>(context, listen: false);
    return AlertDialog(
      title: Text(
        'Add Book Image Cover',
        style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
      content: BlocConsumer<AuthorCubit, AuthorState>(
        listener: (context, state) {
          if (state is AddBookImageSuccessState) {
            context.pop();
            showDialog(
              context: context,
              builder: (context) => const AddFile(),
            );
          }
        },
        builder: (context, state) {
          return SizedBox(
            height: 300.h,
            width: 400.w,
            child: Column(
              children: [
                cubit.image != null
                    ? SizedBox(
                        width: 200.w,
                        height: 200.h,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          shape: const CircleBorder(),
                          elevation: 10,
                          child: Image.memory(
                            cubit.webBookImage,
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                    : const SizedBox(),
                TextButton(
                    onPressed: () async {
                      await cubit.chooseBookImage();
                    },
                    child: const Text("Upload")),
                Transform.translate(
                  offset: Offset(-20.w, 0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: state is AddBookImageLoadingState
                        ? const CircularProgressIndicator()
                        : state is AddBookImageSuccessState
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
                                  cubit.addBookImage(bookId: 1);
                                },
                                color: AppColors.blueButtonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                height: 50.h,
                                minWidth: 135.w,
                                padding: EdgeInsets.zero,
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
