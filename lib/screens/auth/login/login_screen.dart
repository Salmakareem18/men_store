import 'package:app_store/core/helpers/App_ElevatedButton.dart';
import 'package:app_store/core/helpers/App_Field.dart';
import 'package:app_store/core/helpers/App_Styles.dart';
import 'package:app_store/core/helpers/App_colors.dart';
import 'package:app_store/core/helpers/snackBar.dart';
import 'package:app_store/screens/auth/login/cubit/login_cubit.dart';
import 'package:app_store/screens/button_nav/homenav.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.scaffoldColor,
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              mySnackBar(
                msg: state.msg,
                type: ContentType.failure,
                context: context,
              );
            }
            if (state is LoginSuccess) {
              mySnackBar(
                msg: "Login Success",
                type: ContentType.success,
                context: context,
              );
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Homenav(),
                  ));
            }
          },
          builder: (context, state) {
            final cubit = context.read<LoginCubit>();
            if (state is LoginLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 100.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Login to your account",
                      style: AppStyles.kAppStyle32black),
                  Text("It’s great to see you again.",
                      style: AppStyles.kAppStyle16gray),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text("User Name",
                      style:
                          AppStyles.kAppStyle32black.copyWith(fontSize: 16.sp)),
                  SizedBox(
                    height: 5.h,
                  ),
                  AppField(
                    hintText: "Enter your email address",
                    showIcon: false,
                    controller: cubit.namecontroller,
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Text("Password",
                      style:
                          AppStyles.kAppStyle32black.copyWith(fontSize: 16.sp)),
                  SizedBox(
                    height: 5.h,
                  ),
                  AppField(
                    hintText: "Enter your password",
                    controller: cubit.passwordcontroller,
                    obscureText: cubit.obscureText,
                    showIcon: true,
                    eyeWidget: IconButton(
                      onPressed: () {
                        cubit.toggleEye();
                      },
                      icon: Icon(cubit.obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined),
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 55.h,
                  ),
                  AppElevatedbutton(
                    text: 'Sign In',
                    onPressed: () => cubit.login(),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: AppStyles.kAppStyle16gray,
                      ),
                      Text(" Join",
                          style: AppStyles.kAppStyle32black
                              .copyWith(fontSize: 16.sp))
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
