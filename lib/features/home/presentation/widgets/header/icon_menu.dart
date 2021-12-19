import 'package:flutter/material.dart';

class IconMenu extends StatelessWidget {
  const IconMenu({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.apps_rounded),
      onPressed: onPressed,
    );
  }
}
