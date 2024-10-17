import 'package:flutter/material.dart';
import 'package:zen_tasker/core/helper_function/is_tablet.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';
import 'package:zen_tasker/generated/l10n.dart';

class CustomLableAndState extends StatelessWidget {
  const CustomLableAndState({
    super.key,
    required this.label,
    required this.state,
  });

  final String label;
  final bool state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: isMobile(context)
              ? AppStyles.styleMedium16(context)
                  .copyWith(color: Colors.grey[600])
              : AppStyles.styleMedium24(context)
                  .copyWith(color: Colors.grey[600]),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Icon(
              state ? Icons.check_circle_outline : Icons.circle_outlined,
              color: state ? Colors.green : Colors.black,
              size: isMobile(context) ? 24 : 40,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              state ? S.of(context).done : S.of(context).notFinished,
              style: isMobile(context)
                  ? AppStyles.styleMedium20(context).copyWith(
                      color: state ? Colors.green : null,
                      fontWeight: state ? FontWeight.w700 : null,
                    )
                  : AppStyles.styleMedium28(context).copyWith(
                      color: state ? Colors.green : null,
                      fontWeight: state ? FontWeight.w700 : null,
                    ),
            ),
          ],
        ),
      ],
    );
  }
}
