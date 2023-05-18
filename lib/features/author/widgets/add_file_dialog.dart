import 'package:book_store_web/business_logic/author/author_cubit.dart';
import 'package:book_store_web/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AddFile extends StatelessWidget {
  const AddFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthorCubit cubit = BlocProvider.of<AuthorCubit>(context, listen: false);
    return AlertDialog(
      title: Text(
        'Add Book File',
        style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
      content: BlocConsumer<AuthorCubit, AuthorState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return SizedBox(
            height: 300.h,
            width: 400.w,
            child: Column(
              children: [
             //   cubit.file != null
             //        ? Container(
             //      width: 200.w,
             //      height: 200.h,
             //      child: const Card(
             //        clipBehavior: Clip.antiAlias,
             //        shape: CircleBorder(),
             //        elevation: 10,
             //        child: Text(
             //         "Done"
             //        ),
             //      ),
             //    )
             //        :
              SizedBox(),
                TextButton(
                    onPressed: () async {
                      await cubit.chooseFile();
                    },
                    child: const Text("Upload")),
                Transform.translate(
                  offset: Offset(-20.w, 0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: state is AddBookFileLoadingState
                        ? const CircularProgressIndicator()
                        : state is AddBookFileSuccessState
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
                          'Done',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    )
                        : MaterialButton(
                      onPressed: () {
                        cubit.addBookFile(bookId: 1);
                      },
                      color: AppColors.blueButtonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      height: 50.h,
                      minWidth: 135.w,
                      padding: EdgeInsets.zero,
                      child: Text(
                        'Finish',
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
