import 'package:app_store/core/helpers/App_Styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartRow extends StatelessWidget {
  CartRow(
      {super.key,
      required this.label,
      required this.value,
      this.isgray = false});
  String label;
  String value;
  bool isgray;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: isgray
                  ? AppStyles.kAppStyle16gray
                  : AppStyles.kAppStyle16gray.copyWith(color: Colors.black)),
          Text(value, style: AppStyles.kAppStyleProducName),
        ],
      ),
    );
  }
}
