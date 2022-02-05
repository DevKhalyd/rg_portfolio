import 'package:flutter/material.dart';

/// Min space avaible for the search
const minWidthSearch = 700.0;

extension BuildContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get statusBarHeight => MediaQuery.of(this).padding.top;
  bool get isLandscape => width > height + 100;

  /// Verify if its a mobile size
  bool get isMobileSize {
    /// A desktop or tablet
    if (height < width) {
      if (height <= 450 && width <= 850) return true;
      return false;
    }

    // Range to find if it's a mobile size
    if (height <= 860 && width <= 450) return true;

    return false;
  }

  // Until a certain point it's not a good idea to use these methods.
  // Because if the size of the screen changes to min,
  //the returned value will be so small. So the widgets won't be able to show in the interface.
  // becuase of that, use the constrains atributes.

  double getPercentWidth(double percent) {
    assert(percent > 0 && percent < 1);
    return width * percent;
  }

  double getPercentHeight(double percent) {
    assert(percent > 0 && percent < 1);
    return height * percent;
  }

  /// Return true if can
  bool canPop() {
    return Navigator.of(this).canPop();
  }

  void pop() {
    Navigator.pop(this);
  }

  void pushNamed(String name) {
    Navigator.pushNamed(this, name);
  }

  void popIfCan() {
    if (canPop()) pop();
  }
}
