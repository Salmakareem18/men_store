import 'package:app_store/core/helpers/App_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static final kAppStyle32black = TextStyle(
      color: Colors.black, fontSize: 32.sp, fontWeight: FontWeight.w600);
  static final kAppStyle16gray = TextStyle(
      color: AppColors.textGray, fontSize: 16.sp, fontWeight: FontWeight.w400);
  static final kTextStyleButton = TextStyle(
      color: AppColors.textGray, fontSize: 14.sp, fontWeight: FontWeight.w500);
  static final kAppStyleProducName = TextStyle(
      color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600);
  static final kAppStyleProductPrice = TextStyle(
      color: AppColors.textGray, fontSize: 12.sp, fontWeight: FontWeight.w500);
  static final kAppStyle16white = TextStyle(
      color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600);
}
