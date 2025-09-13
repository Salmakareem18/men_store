import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

mySnackBar({
  required String msg,
  required ContentType type,
  required BuildContext context,
}) {
  final snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: type == ContentType.success
          ? 'Success'
          : type == ContentType.failure
              ? 'Error'
              : type == ContentType.warning
                  ? 'Warning'
                  : 'Info',
      message: msg,
      contentType: type,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
