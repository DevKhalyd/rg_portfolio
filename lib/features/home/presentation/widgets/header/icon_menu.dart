import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_ext.dart';


/// The icon menu that show my info about how to reach me
class IconMenu extends StatelessWidget {
  const IconMenu({super.key, required this.onPressed});

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
