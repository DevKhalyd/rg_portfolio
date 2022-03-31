import 'package:flutter/material.dart';

import '../../../../../core/widgets/text_custom.dart';

class TwitterJoinedText extends StatelessWidget {
  const TwitterJoinedText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: const [
      Icon(Icons.calendar_month, color: Colors.grey),
      SizedBox(width: 8),
      TextCustom(
        'Joined November 2011',
        color: Colors.grey,
        fontSize: 18,
      ),
    ]);
  }
}
