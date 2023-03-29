import 'package:flutter/material.dart';

import '../strings_resources/strings_resource.dart';
import 'app_theme.dart';

class AppConfig extends InheritedWidget {
  const AppConfig(
      {Key? key,
      required this.strings,
      required this.appTheme,
      required Widget child})
      : super(key: key, child: child);

  final StringResource strings;
  final AppTheme appTheme;

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
