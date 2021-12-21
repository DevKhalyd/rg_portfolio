import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_ext.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 6,
        child: Stack(
          children: [
            // The Rolando name with Google Font and the field to search for
            Column(),
            // The dialog to show when the menu or icon is pressed
            Positioned(
              top: context.getPercentHeight(0.0005),
              right: context.getPercentWidth(0.001),
              child: Container(),
            ),
          ],
        ));
  }
}
