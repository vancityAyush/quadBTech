import 'package:flutter/material.dart';

import '../font_size.dart';

class Styles {
  Styles._privateConstructor();

  static TextStyle tsWhiteRegularM = TextStyle(
    fontSize: FontSize.m,
    fontWeight: FontWeight.w200,
  );

  static TextStyle tsWhiteXxs = TextStyle(
      fontSize: FontSize.xxxs,
      fontWeight: FontWeight.w400,
      color: Colors.white);

  static TextStyle tsPrimaryXxxl = TextStyle(
    fontSize: FontSize.xxxl,
    fontWeight: FontWeight.w600,
  );

  static TextStyle tsPrimaryXxs = TextStyle(
    fontSize: FontSize.xxs,
    fontWeight: FontWeight.w200,
  );

  static TextStyle tsBoldXl = TextStyle(
    fontSize: FontSize.xl,
    fontWeight: FontWeight.w600,
  );

  static TextStyle ts400Xxxs = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: FontSize.xxxs,
  );

  /// Equivalent to 14px on Figma.
  static TextStyle ts400Xxxxxs = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: FontSize.xxxxxs,
  );

  static TextStyle ts400Xxxxs = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: FontSize.xxxxs,
  );

  static TextStyle ts600Xxl = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: FontSize.xxl,
  );

  static TextStyle ts500Xxxxxs = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: FontSize.xxxxxs,
  );

  static TextStyle ts700Xxxs = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: FontSize.xxxs,
  );

  static TextStyle ts700Xxxxl = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: FontSize.xxxxl,
  );

  static TextStyle tsRegularS = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: FontSize.s,
  );

  static TextStyle ts300M = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: FontSize.m,
  );

  static TextStyle ts700M = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: FontSize.m,
  );

  static TextStyle tsProBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: FontSize.xxxs,
  );
}
