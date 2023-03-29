import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'app_theme.dart';

class AppThemeLight implements AppTheme {
  @override
  Color colorPrimary = const Color(0xfff5f5f5);

  @override
  Color colorAccentText = Color(0xff5669FF);

  @override
  Color colorAccent = const Color(0xff3D56F0);

  @override
  Color colorSecondary = const Color(0xFF3A3942);

  @override
  Color colorTextPrimary = const Color(0xFF120D26);

  @override
  Color colorBackground = const Color(0xfff5f5f5);
  @override
  Color colorGrey = const Color(0xFFB0B1BC);

  @override
  ShimmerDirection shimmerDirection = ShimmerDirection.ltr;

  @override
  Color shimmerBaseColor = Colors.grey[300]!;

  @override
  Color shimmerHighlightColor = Colors.grey[100]!;

  @override
  Color dividerColor = const Color(0xFF7974E7);

  @override
  Color colorTextSecondary = const Color(0xFFDDDDDD);
}
