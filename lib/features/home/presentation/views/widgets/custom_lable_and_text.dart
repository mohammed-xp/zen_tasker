import 'package:flutter/material.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';

class CustomLableAndText extends StatelessWidget {
  const CustomLableAndText({
    super.key,
    required this.lable,
    required this.text,
  });

  final String lable, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lable,
          style: AppStyles.styleMedium16(context)
              .copyWith(color: Colors.grey[600]),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: AppStyles.styleMedium20(context),
        ),
      ],
    );
  }
}
