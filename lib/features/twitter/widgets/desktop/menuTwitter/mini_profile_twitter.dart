import 'package:flutter/material.dart';

import '../../../../../core/widgets/rolando_image.dart';
import '../../../../../core/widgets/text_custom.dart';

/// The profile at the bottom of the menu
class MiniProfileTwitter extends StatelessWidget {
  const MiniProfileTwitter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const RolandoImage(),
        const SizedBox(width: 20),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TextCustom(
              'Rolando Garcia',
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.white,
            ),
            SizedBox(
              height: 6.0,
            ),
            TextCustom(
              '@randomusername',
              fontSize: 22,
              color: Colors.grey,
            ),
          ],
        ),
        const SizedBox(width: 40),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_horiz_outlined,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
