import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../core/widgets/text_custom.dart';
import '../../../utils_twitter.dart';

final _style = ElevatedButton.styleFrom(
  // primary: Colors.transparent,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(32.0),
  ),
);

class OptionButton extends StatelessWidget {
  const OptionButton({
    super.key,
    required this.label,
    required this.icon,
  });

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: UtilsTwitter.heightButton,
        width: UtilsTwitter.widthButton,
        child: ElevatedButton(
          style: _style,
          child: Row(
            children: [
              Icon(
                icon,
                size: 36,
              ),
              const SizedBox(width: 24),
              TextCustom(
                label,
                fontSize: 24,
                color: Colors.white,
              ),
            ],
          ),
          onPressed: () {
            log('Doing something for example...');
          },
        ),
      ),
    );
  }
}
