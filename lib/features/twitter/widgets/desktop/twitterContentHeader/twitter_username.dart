import 'package:flutter/material.dart';
import 'package:rg_portfolio/core/widgets/text_custom.dart';

import 'twitter_flutter_verified.dart';

/// The name and the username one above of the other
class TwitterUsername extends StatelessWidget {
  const TwitterUsername({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        TwitterFlutterVerified(),
        SizedBox(height: 10),
        TextCustom(
          '@FlutterDev',
          color: Colors.grey,
        ),
      ],
    );
  }
}
