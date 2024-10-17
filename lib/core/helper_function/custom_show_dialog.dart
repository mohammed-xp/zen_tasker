import 'package:flutter/material.dart';
import 'package:zen_tasker/core/widgets/alert_dialog_widget.dart';

Future<dynamic> customShowDialog(
  BuildContext context, {
  required String title,
  required String message,
  required String confirmText,
  required void Function() onConfirm,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialogWidget(
          title: title,
          message: message,
          confirmText: confirmText,
          onConfirm: onConfirm,
        );
      });
}
