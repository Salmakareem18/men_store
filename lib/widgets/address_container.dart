import 'package:app_store/core/helpers/App_assets.dart';
import 'package:flutter/material.dart';
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
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(12),
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
