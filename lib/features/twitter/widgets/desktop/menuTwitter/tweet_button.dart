import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../core/widgets/text_custom.dart';
import '../../../utils_twitter.dart';

final _style = ElevatedButton.styleFrom(
  primary: UtilsTwitter.primary,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(32.0),
  ),
);

class TwitterButton extends StatelessWidget {
  const TwitterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UtilsTwitter.heightButton,
      width: UtilsTwitter.widthButton,
      child: ElevatedButton(
        style: _style,
        child: const TextCustom(
          'Tweet',
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        onPressed: () {
          log('Doing something for tweet...');
        },
      ),
    );
  }
}
