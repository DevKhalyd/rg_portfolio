import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton(this.label, {super.key, this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Padding(padding: const EdgeInsets.all(10.0), child: Text(label)),
    );
  }
}
