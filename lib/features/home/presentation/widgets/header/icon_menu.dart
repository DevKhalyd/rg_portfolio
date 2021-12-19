import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_ext.dart';


class IconMenu extends StatelessWidget {
  const IconMenu({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.getPercentWidth(0.005)),
      child: IconButton(
        tooltip: 'Menu',
        icon: const Icon(Icons.apps_rounded),
        onPressed: onPressed,
      ),
    );
  }
}
