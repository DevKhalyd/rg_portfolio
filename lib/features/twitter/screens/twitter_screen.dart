import 'package:flutter/material.dart';

import '../../../core/widgets/responsive_design.dart';
import 'twitter_desktop.dart';
import 'twitter_mobile.dart';

/// The screen that contains both designs (desktop and mobile)
class TwitterScreen extends StatelessWidget {
  const TwitterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveDesign(
      desktopSize: TwitterDesktop(),
      mobileSize: TwitterMobile(),
    );
  }
}
