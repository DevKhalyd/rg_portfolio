import 'package:flutter/material.dart';

typedef InputDialogCallback = void Function(String value);

class InputDialog extends StatelessWidget {
  final String title;
  final String labelText;
  final String cancelText;
  final String acceptText;
  final void Function(String value) onConfirm;

  const InputDialog({
    super.key,
    required this.title,
    required this.labelText,
    this.cancelText = 'Cancel',
    this.acceptText = 'OK',
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return AlertDialog(
      title: Text(title),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(cancelText),
        ),
        ElevatedButton(
          onPressed: () {
            final input = controller.text.trim();
            if (input.isEmpty) {
              Navigator.of(context).pop();
              return;
            }
            Navigator.of(context).pop();
            onConfirm(input);
          },
          child: Text(acceptText),
        ),
      ],
    );
  }
}
