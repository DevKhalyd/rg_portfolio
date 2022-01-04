import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton(
    this.label, {
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(label),
      ),
      onPressed: onPressed,
    );
  }
}
