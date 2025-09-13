import 'package:app_store/core/helpers/App_Styles.dart';
import 'package:app_store/core/helpers/App_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppbar({
    super.key,
    this.icon,
    required this.title,
    this.bottom,
  });
  String title;
  IconData? icon;
  PreferredSizeWidget? bottom;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.scaffoldColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        bottom: bottom,
        centerTitle: true,
        title: Text(title, style: AppStyles.kAppStyle32black),
        leading: BackButton());
  }

  @override
  Size get preferredSize => Size.fromHeight(100.h);
}
