import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/helpers/App_colors.dart';

class CartButton extends StatelessWidget {
  CartButton({super.key, required this.icon});
  IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 23.w,
      height: 23.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        shape: BoxShape.rectangle,
      ),
      child: Icon(icon, size: 18.sp),
    );
  }
}
