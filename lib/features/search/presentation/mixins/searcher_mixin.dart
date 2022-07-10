import 'dart:math';

import 'package:flutter/material.dart';
import '../../../../core/extensions/build_context_ext.dart';

const side = 25.0;

const widthImageProject = 400.0;

/// Methods for the searcher screen
mixin SearcherMixin {
  /// True if the current space is enough to display the full design
  /// otherwise show the mobile design. This just for the Searcher Part
  bool isEnoughSpace(BuildContext context) => context.width > minWidthSearch;

  int getTimeInSeconds() {
    return Random().nextInt(99);
  }
}
