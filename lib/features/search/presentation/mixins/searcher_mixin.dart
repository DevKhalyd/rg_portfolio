import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rg_portfolio/core/extensions/build_context_ext.dart';

const side = 25.0;

/// Methods for the searcher screen
mixin SearcherMixin {
  /// True if the current space is enough to display the full design
  /// Otherwise show the mobile design
  bool isEnoughSpace(BuildContext context) => context.width > minWidthSearch;

  int getTimeInSeconds() {
    return Random().nextInt(99);
  }
}