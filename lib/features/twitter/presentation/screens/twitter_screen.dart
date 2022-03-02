import 'package:flutter/material.dart';
import 'package:rg_portfolio/core/widgets/responsive_design.dart';

class TwitterScreen extends StatelessWidget {
  const TwitterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Start to building
    return ResponsiveDesign(
      desktopSize: Container(
        color: Colors.red,
      ),
      mobileSize: Container(
        color: Colors.blue,
      ),
    );
  }
}
