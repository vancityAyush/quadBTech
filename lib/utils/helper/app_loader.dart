import 'package:flutter/material.dart';

class AppLoader {
  static var _isLoaderShowing = false;

  static void showLoader(BuildContext context,
      {bool barrierDismissible = false}) {
    if (!_isLoaderShowing) {
      showDialog(
        context: context,
        builder: (context) => WillPopScope(
          onWillPop: () => Future.value(barrierDismissible),
          child: const Center(child: CircularProgressIndicator()),
        ),
      );
      _isLoaderShowing = true;
    }
  }

  static void hideLoader(BuildContext context) {
    if (_isLoaderShowing) {
      Navigator.pop(context);
      _isLoaderShowing = false;
    }
  }
}
