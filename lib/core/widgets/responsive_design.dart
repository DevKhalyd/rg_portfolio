import 'package:flutter/material.dart';
import 'package:rg_portfolio/core/mixins/screen_validation_mixin.dart';

class ResponsiveDesign extends StatelessWidget with ScreenValidationMixin {
  const ResponsiveDesign(
      {super.key, required this.desktopSize, required this.mobileSize});

  final Widget desktopSize;
  final Widget mobileSize;

  @override
  Widget build(BuildContext context) {
    if (isDesktopSize(context)) {
      return desktopSize;
    } else {
      return mobileSize;
    }
  }
}
