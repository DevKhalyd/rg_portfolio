import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rg_portfolio/core/widgets/text_center.dart';

import '../../../../core/widgets/text_custom.dart';
import '../../utils_twitter.dart';

final _style = ElevatedButton.styleFrom(
  primary: Colors.transparent,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(32.0),
  ),
);

class OptionButton extends StatelessWidget {
  const OptionButton({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UtilsTwitter.heightButton,
      width: UtilsTwitter.widthButton,
      child: ElevatedButton(
        style: _style,
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 24),
            TextCustom(
              label,
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        onPressed: () {
          log('Doing something for example...');
        },
      ),
    );
  }
}
