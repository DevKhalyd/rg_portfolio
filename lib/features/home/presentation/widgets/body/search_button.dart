import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      // TODO: Check out the behavior when is onHover
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(label),
      ),
      onPressed: onPressed,
    );
  }
}
