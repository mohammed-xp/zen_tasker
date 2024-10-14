import 'package:flutter/material.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';
import 'package:zen_tasker/features/create_task/presentation/views/widgets/custom_clicked_text_field.dart';

class LableDateAndTimeTextField extends StatelessWidget {
  const LableDateAndTimeTextField({
    super.key,
    required this.title,
    required this.messageValidate,
    required this.onSaved,
    required this.onTap,
    required this.controller,
    required this.hintText,
  });

  final String title, hintText, messageValidate;
  final void Function(String?) onSaved;
  final void Function() onTap;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.styleMedium12(context),
        ),
        const SizedBox(
          height: 8,
        ),
        CustomClickedTextField(
          controller: controller,
          hintText: hintText,
          onSaved: onSaved,
          messageValidate: messageValidate,
          textInputType: TextInputType.text,
          onTap: onTap,
        ),
      ],
    );
  }
}
