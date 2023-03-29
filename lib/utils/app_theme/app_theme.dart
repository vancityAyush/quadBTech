import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

abstract class AppTheme {
  late Color colorPrimary;
  late Color colorSecondary;
  late Color colorAccent;
  late Color colorAccentText;
  late Color colorTextPrimary;
  late Color colorTextSecondary;
  late Color colorBackground;
  late ShimmerDirection shimmerDirection;
  late Color shimmerBaseColor;
  late Color shimmerHighlightColor;
  late Color dividerColor;
}
