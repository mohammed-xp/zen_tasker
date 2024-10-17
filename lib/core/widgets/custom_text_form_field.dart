import 'package:flutter/material.dart';
import 'package:zen_tasker/core/helper_function/is_tablet.dart';
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
    required this.controller,
  });

  final void Function(String?) onSaved;
  final String hintText, messageValidate;
  final TextInputType textInputType;
  final int? maxLines;
  final Color? backgroundColor;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      controller: controller,
      style: isMobile(context)
          ? AppStyles.styleMedium16(context)
          : AppStyles.styleSemiBold20(context),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return messageValidate;
        }
        return null;
      },
      keyboardType: textInputType,
      minLines: isMobile(context) ? 1 : maxLines ?? 5,
      maxLines: isMobile(context) ? maxLines : null,
      // textInputAction: TextInputAction.,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: isMobile(context)
            ? AppStyles.styleMedium16(context).copyWith(
                color: const Color(0xFFA8A8A8),
              )
            : AppStyles.styleSemiBold20(context).copyWith(
                color: const Color(0xFFA8A8A8),
              ),
        errorStyle: isMobile(context)
            ? AppStyles.styleMedium12(context).copyWith(color: Colors.redAccent)
            : AppStyles.styleMedium20(context)
                .copyWith(color: Colors.redAccent),
        filled: true,
        fillColor: isMobile(context)
            ? backgroundColor ?? const Color(0xFFF5F5F5)
            : const Color(0xFFF5F5F5),
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
