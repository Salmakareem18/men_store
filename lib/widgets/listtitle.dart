import 'package:app_store/core/helpers/App_Styles.dart';
import 'package:flutter/material.dart';

class ListTitleProfile extends StatelessWidget {
  ListTitleProfile(
      {super.key,
      required this.leading,
      required this.title,
      this.trianling,
      this.style});
  String title;
  Widget leading;
  Widget? trianling;
  TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(title, style: style),
      trailing: trianling,
    );
  }
}
