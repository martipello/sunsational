import 'dart:math' as math;

import 'package:flutter/material.dart';

const double kMaxScreenWidth = 700;

extension MediaQueryDataExtension on MediaQueryData {

  bool get isLargeScreen => size.width > kMaxScreenWidth;

  double get maxContentWidth => math.min(size.width, kMaxScreenWidth);

}
