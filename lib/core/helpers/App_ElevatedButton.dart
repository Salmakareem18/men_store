import 'package:app_store/core/helpers/App_Styles.dart';
import 'package:app_store/core/helpers/App_colors.dart';
import 'package:flutter/material.dart';

class AppElevatedbutton extends StatelessWidget {
  AppElevatedbutton(
      {super.key, this.text, required this.onPressed, this.widget, this.size});

  String? text;
  void Function()? onPressed;
  Widget? widget;
  Size? size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          fixedSize: size ?? Size(380, 50),
          backgroundColor: AppColors.primaryColor,
        ),
        child: widget ??
            Text(text!,
                style: AppStyles.kTextStyleButton
                    .copyWith(color: AppColors.textButtonColor)));
  }
}
