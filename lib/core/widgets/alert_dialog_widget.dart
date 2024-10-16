import 'package:flutter/material.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';
import 'package:zen_tasker/generated/l10n.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({
    super.key,
    required this.title,
    required this.message,
    required this.confirmText,
    required this.onConfirm,
  });

  final String title;
  final String message;
  final String confirmText;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      titleTextStyle: AppStyles.styleBold35(context).copyWith(
        color: Colors.red,
      ),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            S.of(context).cancel,
            style: AppStyles.styleMedium16(context),
          ),
        ),
        TextButton(
          onPressed: () => onConfirm,
          child: Text(
            confirmText,
            style: AppStyles.styleMedium16(context).copyWith(
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
