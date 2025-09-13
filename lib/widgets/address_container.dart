import 'package:app_store/core/helpers/App_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../core/helpers/App_Styles.dart';
import '../core/helpers/App_colors.dart';

class AddressContainer extends StatelessWidget {
  AddressContainer({super.key, required this.title, required this.subtitle});
  Widget title;
  String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.w),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListTile(
        leading: SvgPicture.asset(AppAssets.locationAssets),
        title: title,
        subtitle: Text(
          subtitle,
          style: AppStyles.kTextStyleButton,
        ),
      ),
    );
  }
}
