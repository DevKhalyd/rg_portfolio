import 'package:flutter/material.dart';
import '../extensions/build_context_ext.dart';

mixin ScreenValidationMixin on Widget {
  bool isDesktopSize(BuildContext context) {
    final width = context.width;
    return width > 800;
  }
}
