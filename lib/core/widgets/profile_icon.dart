import 'package:flutter/material.dart';

import '../extensions/build_context_ext.dart';
import '../utils/utils.dart';
import 'roland_image.dart';

/// Show my profile picture and when it's pressed, show the menu
/// with more info about me
class ProfileIcon extends StatelessWidget {
  const ProfileIcon({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      richMessage: const TextSpan(
          text: 'My account\n',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: 'Rolando Garcia\n',
              style: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
            TextSpan(
              text: Utils.email,
              style: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
          ]),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: context.getPercentWidth(0.005)),
        child: InkResponse(
          hoverColor: Colors.transparent,
          onTap: onPressed,
          child: const RolandImage(),
        ),
      ),
    );
  }
}
