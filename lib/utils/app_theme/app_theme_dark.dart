import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'app_theme.dart';

class AppThemeLight implements AppTheme {
  @override
  Color colorPrimary = const Color(0xfff5f5f5);

  @override
  Color colorAccentText = Color(0xff5669FF);

  @override
  Color colorAccent = const Color(0xFFFF8784);

  @override
  Color colorSecondary = const Color(0xFF3A3942);

  @override
  Color colorTextPrimary = const Color(0xFF120D26);

  @override
  Color colorTextSecondary = const Color(0xFF747688);

  @override
  Color colorTextHeading = const Color(0xFF00081D);

  @override
  Color colorAccentSecondary = const Color(0xFF033FA8);

  @override
  Color colorBackground = const Color(0xfff5f5f5);

  @override
  Color colorDrawerSecondary = const Color(0xFFD6F1FA);

  @override
  Color colorButtonRed = const Color(0xffDB454C);

  @override
  Color colorButtonPink = const Color(0xffE6666C);

  @override
  Color colorButtonTeal = const Color(0xff30ADA3);

  @override
  Color colorButtonGreen = const Color(0xFF53B972);

  @override
  Color colorButtonOrange = const Color(0xFFFF7F00);

  @override
  Color colorButtonYellow = const Color(0xFFFCD36A);

  @override
  Color colorButtonTransparent = Colors.transparent;

  @override
  Color colorBorder = Colors.black.withOpacity(0.1);

  @override
  Color colorBoxShadow = const Color.fromRGBO(0, 0, 0, 0.1);

  @override
  Color colorTimelinePrimary = const Color(0xFF58BBB3);

  @override
  Color colorTimelineSecondary = const Color(0xFF787E83).withOpacity(0.2);

  @override
  Color colorTimelineAccent = const Color(0xffe6e7e9);

  @override
  Color colorSecondaryDark = const Color(0xff05307B);

  @override
  Color colorIconSecondary = const Color(0xffCCCCCC);

  @override
  Color colorGrey = const Color(0xFFB0B1BC);
  @override
  Color colorWhite = const Color(0xFFFFFFFF);

  @override
  Color colorGreyTransparent = const Color(0xFF555555).withOpacity(0.8);

  @override
  Color colorGreyTransparent2 = const Color(0xFFCCCCCC).withOpacity(0.8);

  @override
  Color colorBorder2 = const Color(0xFF999999);

  @override
  ButtonStyle buttonStyle(Color color, {bool withBorder = false}) =>
      ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(200.0),
            side:
                BorderSide(color: withBorder ? colorGrey : Colors.transparent),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(color),
      );

  @override
  ShimmerDirection shimmerDirection = ShimmerDirection.ltr;

  @override
  Color shimmerBaseColor = Colors.grey[300]!;

  @override
  Color shimmerHighlightColor = Colors.grey[100]!;

  @override
  Color colorTextPrimaryDim = const Color(0xFFAAAAAA);

  @override
  Color colorProButtonOrange = const Color(0xFFFF8F44);

  @override
  Color colorProButtonGreen = const Color(0xFF5CB85C);

  @override
  Color dividerColor = const Color(0xFF7974E7);
}
