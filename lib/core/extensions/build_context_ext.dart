import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get statusBarHeight => MediaQuery.of(this).padding.top;

  double getPercentWidth(double percent) {
    assert(percent > 0 && percent < 1);
    return width * percent;
  }

  double getPercentHeight(double percent) {
    assert(percent > 0 && percent < 1);
    return height * percent;
  }
}
