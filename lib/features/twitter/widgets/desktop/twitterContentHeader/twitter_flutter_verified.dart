import 'package:flutter/material.dart';

import '../../../../../core/widgets/text_custom.dart';

/// The flutter word with the check icon
class TwitterFlutterVerified extends StatelessWidget {
  const TwitterFlutterVerified({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        TextCustom(
          'Flutter',
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 24,
          letterSpacing: 1.5,
        ),
        SizedBox(width: 10),
        Icon(
          Icons.verified,
          color: Colors.white,
        )
      ],
    );
  }
}
