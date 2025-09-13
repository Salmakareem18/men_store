import 'package:flutter/material.dart';

import '../core/helpers/App_colors.dart';

class CartButton extends StatelessWidget {
  CartButton({required this.icon});
  IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 23,
      height: 23,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        shape: BoxShape.rectangle,
      ),
      child: Icon(icon, size: 18),
    );
  }
}
