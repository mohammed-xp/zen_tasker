import 'package:flutter/material.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.onSaved,
    required this.messageValidate,
    required this.textInputType,
    required this.maxLines,
    this.backgroundColor,
    required this.hintText,
  });

  final void Function(String?) onSaved;
  final String hintText, messageValidate;
  final TextInputType textInputType;
  final int? maxLines;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return messageValidate;
        }
        return null;
      },
      keyboardType: textInputType,
      minLines: 1,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppStyles.styleMedium16(context).copyWith(
          color: const Color(0xFFA8A8A8),
        ),
        filled: true,
        fillColor: backgroundColor ?? const Color(0xFFF5F5F5),
        border: buildBorder(backgroundColor: backgroundColor),
        enabledBorder: buildBorder(backgroundColor: backgroundColor),
        focusedBorder: buildBorder(backgroundColor: backgroundColor),
      ),
    );
  }

  OutlineInputBorder buildBorder({Color? backgroundColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: BorderSide(
        color: backgroundColor ?? const Color(0xFFF5F5F5),
      ),
    );
  }
}
