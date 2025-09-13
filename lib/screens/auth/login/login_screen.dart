import 'package:app_store/core/helpers/App_ElevatedButton.dart';
import 'package:app_store/core/helpers/App_Field.dart';
import 'package:app_store/core/helpers/App_Styles.dart';
import 'package:app_store/core/helpers/App_colors.dart';
import 'package:app_store/core/helpers/snackBar.dart';
import 'package:app_store/screens/auth/login/cubit/login_cubit.dart';
import 'package:app_store/screens/button_nav/homenav.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  Text("LoginToYourAccount", style: AppStyles.kAppStyle32black)
                      .tr(),
                  Text("Welcom", style: AppStyles.kAppStyle16gray).tr(),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text("UserName",
                          style: AppStyles.kAppStyle32black
                              .copyWith(fontSize: 16.sp))
                      .tr(),
                  SizedBox(
                    height: 5.h,
                  ),
                  AppField(
                    hintText: "YourName".tr(),
                    showIcon: false,
                    controller: cubit.namecontroller,
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Text("Password".tr(),
                          style: AppStyles.kAppStyle32black
                              .copyWith(fontSize: 16.sp))
                      .tr(),
                  SizedBox(
                    height: 5.h,
                  ),
                  AppField(
                    hintText: "yourpassword".tr(),
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
                    text: "SignIn".tr(),
                    onPressed: () => cubit.login(),
                  ),
                  SwitchListTile(
                      title: Text("Change Language"),
                      value: context.locale.languageCode == 'en',
                      onChanged: (value) {
                        context
                            .setLocale((value ? Locale('en') : Locale('ar')));
                      }),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?".tr(),
                        style: AppStyles.kAppStyle16gray,
                      ),
                      Text(" Creat Account".tr(),
                          style: AppStyles.kAppStyle32black
                              .copyWith(fontSize: 16.sp))
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
