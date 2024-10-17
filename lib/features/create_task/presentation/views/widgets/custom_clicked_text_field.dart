import 'package:flutter/material.dart';
import 'package:zen_tasker/core/helper_function/is_tablet.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';

class CustomClickedTextField extends StatelessWidget {
  const CustomClickedTextField({
    super.key,
    required this.onSaved,
    required this.messageValidate,
    required this.textInputType,
    required this.onTap,
    required this.controller,
    required this.hintText,
  });

  final void Function(String?) onSaved;
  final String hintText, messageValidate;
  final TextInputType textInputType;
  final void Function() onTap;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
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
      onTap: onTap,
      readOnly: true,
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
        fillColor: const Color(0xFFF5F5F5),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: const BorderSide(
        color: Color(0xFFF5F5F5),
      ),
    );
  }
}
