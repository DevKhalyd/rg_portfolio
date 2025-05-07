import 'package:flutter/material.dart';
import 'package:rg_portfolio/core/dialogs/input_dialog.dart';
import 'package:rg_portfolio/core/dialogs/warning_dialog.dart';

mixin Dialogs {
  void showWarningDialog({
    required BuildContext context,
    required String title,
    required String content,
    bool barrierDismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => WarningDialog(title: title, content: content),
    );
  }

  void showInputDialog({
    required BuildContext context,
    required String title,
    required String labelText,
    required InputDialogCallback onConfirm,
    bool barrierDismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder:
          (_) => InputDialog(
            title: title,
            labelText: labelText,
            onConfirm: onConfirm,
          ),
    );
  }
}
