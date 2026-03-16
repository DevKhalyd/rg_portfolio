import 'package:flutter/material.dart';

class WarningDialog extends StatelessWidget {
  final String title;
  final String content;
  final String okButtonText;

  const WarningDialog({
    super.key,
    required this.title,
    required this.content,
    this.okButtonText = 'OK',
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(okButtonText),
        ),
      ],
    );
  }
}
