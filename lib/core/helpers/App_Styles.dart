import 'package:app_store/core/helpers/App_colors.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static const kAppStyle32black =
      TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.w600);
  static const kAppStyle16gray = TextStyle(
      color: AppColors.textGray, fontSize: 16, fontWeight: FontWeight.w400);
  static const kTextStyleButton = TextStyle(
      color: AppColors.textGray, fontSize: 14, fontWeight: FontWeight.w500);
  static const kAppStyleProducName =
      TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600);
  static const kAppStyleProductPrice = TextStyle(
      color: AppColors.textGray, fontSize: 12, fontWeight: FontWeight.w500);
  static const kAppStyle16white =
      TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600);
}
