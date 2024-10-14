import 'package:flutter/material.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';
import 'package:zen_tasker/core/widgets/custom_text_form_field.dart';

class LableTextFormField extends StatelessWidget {
  const LableTextFormField({
    super.key,
    required this.title,
    required this.messageValidate,
    required this.onSaved,
    required this.textInputType,
    this.maxLines,
    this.backgroundColor,
    required this.hintText,
  });

  final String title, hintText, messageValidate;
  final void Function(String?) onSaved;
  final TextInputType textInputType;
  final int? maxLines;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.styleMedium16(context).copyWith(
            color: const Color(0xFF363942),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        CustomTextFormField(
          hintText: hintText,
          onSaved: onSaved,
          messageValidate: messageValidate,
          textInputType: textInputType,
          maxLines: maxLines,
          backgroundColor: backgroundColor,
        ),
      ],
    );
  }
}
