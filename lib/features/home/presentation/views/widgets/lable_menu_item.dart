import 'package:flutter/material.dart';
import 'package:zen_tasker/core/helper_function/is_tablet.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';

class LableMenuItem extends StatelessWidget {
  const LableMenuItem({
    super.key,
    required this.text,
    required this.icon,
    this.color,
  });

  final String text;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: isMobile(context) ? 22 : 25,
          color: color ?? Colors.black,
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: isMobile(context)
              ? AppStyles.styleMedium14(context).copyWith(
                  color: color ?? Colors.black,
                )
              : AppStyles.styleMedium16(context).copyWith(
                  color: color ?? Colors.black,
                ),
        ),
      ],
    );
  }
}
