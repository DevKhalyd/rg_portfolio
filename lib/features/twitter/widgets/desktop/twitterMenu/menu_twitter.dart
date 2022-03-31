import 'package:flutter/material.dart';

import 'mini_profile_twitter.dart';
import 'option_button.dart';
import 'tweet_button.dart';
import 'twitter_icon.dart';

class MenuTwitter extends StatelessWidget {
  const MenuTwitter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        // Ref: https://stackoverflow.com/a/56327933/10942018
        return SingleChildScrollView(
          child: ConstrainedBox(
            // Assign the max height as the minHeight of the parent
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            // Add the height of this child. This widget might be expensive
            //to use in certain cases.
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  SizedBox(height: 40),
                  TwitterIcon(),
                  SizedBox(height: 30),
                  OptionButton(
                    label: 'Bookmarks',
                    icon: Icons.bookmark_border,
                  ),
                  OptionButton(
                    label: 'Retweets',
                    icon: Icons.repeat,
                  ),
                  OptionButton(
                    label: 'Likes',
                    icon: Icons.favorite,
                  ),
                  OptionButton(
                    label: 'Profile',
                    icon: Icons.person_outline,
                  ),
                  OptionButton(
                    label: 'Messages',
                    icon: Icons.message_outlined,
                  ),
                  OptionButton(
                    label: 'Notifications',
                    icon: Icons.notifications_outlined,
                  ),
                  OptionButton(
                    label: 'Communities',
                    icon: Icons.group_outlined,
                  ),
                  Spacer(),
                  TwitterButton(),
                  SizedBox(height: 60),
                  MiniProfileTwitter(),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
