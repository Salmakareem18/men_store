import 'package:app_store/core/helpers/App_Styles.dart';
import 'package:app_store/core/helpers/App_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppField extends StatelessWidget {
  AppField(
      {super.key,
      required this.hintText,
      this.showIcon,
      this.controller,
      this.obscureText = false,
      this.eyeWidget,
      this.prefix});
  String hintText;
  bool? showIcon;
  TextEditingController? controller;
  bool obscureText;
  Widget? eyeWidget;
  Widget? prefix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.borderColor),
          ),
          suffixIcon: showIcon == false ? SizedBox.shrink() : eyeWidget,
          prefixIcon: prefix,
          hintText: hintText,
          hintStyle: AppStyles.kAppStyle16gray),
    );
  }
}
