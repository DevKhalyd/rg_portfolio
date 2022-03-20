import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../core/widgets/widgets.dart';

class TwitterFollowButton extends StatelessWidget {
  const TwitterFollowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        // The color when press the button
        onPrimary: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
      onPressed: () {
        log('Doing something...');
      },
      child: const TextCustom(
        'Follow',
        color: Colors.black,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    );
  }
}
