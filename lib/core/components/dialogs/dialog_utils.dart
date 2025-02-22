import 'package:flutter/material.dart';
import 'confirmation_dialog.dart';

Future<bool?> showConfirmationDialog({
  required BuildContext context,
  required String title,
  required String content,
  required String cancelText,
  required String confirmText,
  Color? confirmColor,
}) {
  return showDialog<bool>(
    context: context,
    builder: (context) => ConfirmationDialog(
      title: title,
      content: content,
      cancelText: cancelText,
      confirmText: confirmText,
      confirmColor: confirmColor,
    ),
  );
}
