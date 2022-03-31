import 'package:flutter/material.dart';

import '../../../../../core/widgets/text_custom.dart';

class TwitterNumbersLabel extends StatelessWidget {
  const TwitterNumbersLabel({
    Key? key,
    required this.label,
    required this.number,
  }) : super(key: key);

  final String label;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextCustom(
          number,
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.white,
        ),
        const SizedBox(width: 8),
        TextCustom(
          label,
          color: Colors.grey,
          fontSize: 20,
          letterSpacing: 1.2,
        ),
      ],
    );
  }
}
