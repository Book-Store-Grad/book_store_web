import 'package:book_store_web/features/author/pages/author_books_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../business_logic/login/login_cubit.dart';
import '../../home/pages/home_page.dart';
import '../widgets/auth_app_bar.dart';
import '../../../shared/widgets/default_button.dart';
import '../../../shared/widgets/footer.dart';
import '../widgets/auth_error_dialog.dart';
import '../../../shared/widgets/default_text_form_field.dart';
import 'forgot_password_page.dart';
import 'signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = BlocProvider.of<LoginCubit>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Form(
          key: cubit.loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 38.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.h),
              DefaultTextFormField(
                label: 'Email',
                hint: 'Enter your E-mail',
                onChanged: (email) => cubit.loginSchema.email = email,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Your Email";
                  }
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return "Please Enter a Valid Email";
                  }
                  return null;
                },
              ),
              SizedBox(height: 25.h),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return DefaultTextFormField(
                    label: 'Password',
                    hint: 'Enter your password',
                    onChanged: (password) =>
                        cubit.loginSchema.password = password,
                    isHidden: cubit.passwordHidden,
                    suffixIcon: cubit.passwordHidden ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                    onSuffixPressed: () {
                      cubit.switchPassword();
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Your Password";
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) {
                      if (cubit.loginFormKey.currentState!.validate()) {
                        cubit.loginUser();
                      }
                    },
                  );
                },
              ),
              SizedBox(height: 18.h),
              SizedBox(
                width: 350.w,
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: () {
                      context.go(ForgotPasswordPage.routeName);
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 18.h),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccessState) {
                    if(state.role.toLowerCase() == 'author') {
                      return context.go(AuthorBooksPage.routeName);
                    }
                    return context.go(HomePage.routeName);
                  }
                  if (state is LoginFailureState) {
                    showDialog(
                      context: context,
                      builder: (context) => AuthErrorDialog(error: state.error),
                    );
                  }
                },
                builder: (context, state) {
                  return state is LoginLoadingState
                      ? const CircularProgressIndicator()
                      : DefaultButton(
                          onPressed: () {
                            if (cubit.loginFormKey.currentState!.validate()) {
                              cubit.loginUser();
                            }
                          },
                          height: 56.h,
                          width: 300.w,
                          text: 'Login',
                        );
                },
              ),
              SizedBox(height: 14.h),
              SizedBox(
                width: 350.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.go(SignUpPage.routeName);
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
