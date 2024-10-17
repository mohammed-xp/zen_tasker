import 'package:flutter/material.dart';
import 'package:zen_tasker/core/helper_function/is_tablet.dart';
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
          style: isMobile(context)
              ? AppStyles.styleMedium16(context)
                  .copyWith(color: Colors.grey[600])
              : AppStyles.styleMedium24(context)
                  .copyWith(color: Colors.grey[600]),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: isMobile(context)
              ? AppStyles.styleMedium20(context)
              : AppStyles.styleMedium28(context),
        ),
      ],
    );
  }
}
