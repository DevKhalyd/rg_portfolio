import 'package:flutter/material.dart';

import '../../../../../core/widgets/text_custom.dart';

/// Flutter with the check and the total of tweets
class TitleBar extends StatelessWidget {
  const TitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
        ),
        const SizedBox(height: 10),
        const TextCustom(
          '1,832 Tweets',
          color: Colors.grey,
        ),
      ],
    );
  }
}
