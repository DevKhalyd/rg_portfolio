import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_ext.dart';

/// The text field when the user search for the new things about me
class TextFieldSearcher extends StatelessWidget {
  const TextFieldSearcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.width * 0.35;

    return Container(
      constraints: const BoxConstraints(
        maxWidth: 900,
        minWidth: 400,
      ),
      width: width,
      child: TextFormField(),
    );
  }
}
