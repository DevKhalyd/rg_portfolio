import 'package:flutter/material.dart';
import 'package:rg_portfolio/features/twitter/widgets/desktop/tweet_button.dart';

import 'option_button.dart';

class OptionsTwitter extends StatelessWidget {
  const OptionsTwitter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        OptionButton(
          label: 'Tweet',
          icon: Icons.send,
        ),
        SizedBox(height: 24),
        OptionButton(
          label: 'Retweet',
          icon: Icons.repeat,
        ),
        SizedBox(height: 24),
        OptionButton(
          label: 'Like',
          icon: Icons.favorite,
        ),
        TwitterButton(),
      ],
    );
  }
}
