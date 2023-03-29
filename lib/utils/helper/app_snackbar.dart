import 'package:flutter/material.dart';

import '../app_theme/app_config.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppSnackBar {
  static void show(BuildContext context, String text, {String? snackBarLabel}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        action: SnackBarAction(
          label: snackBarLabel ?? '',
          textColor: AppConfig.of(context).appTheme.colorAccent,
          onPressed: () {
            ScaffoldMessenger.of(context).clearSnackBars();
          },
        ),
      ),
    );
  }
}

class AppToast {
  static void showToast(String message) => Fluttertoast.showToast(msg: message);
}
