import 'package:flutter/material.dart';

import '../../../../../core/widgets/text_custom.dart';
import 'twitter_flutter_verified.dart';

/// Flutter with the check and the total of tweets
class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        TwitterFlutterVerified(),
        SizedBox(height: 10),
        TextCustom('1,832 Tweets', color: Colors.grey),
      ],
    );
  }
}
