import 'package:flutter/material.dart';
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
          style: AppStyles.styleMedium16(context)
              .copyWith(color: Colors.grey[600]),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Icon(
              state ? Icons.check_circle_outline : Icons.circle_outlined,
              color: state ? Colors.green : Colors.grey,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              state ? S.of(context).done : S.of(context).notFinished,
              style: AppStyles.styleMedium20(context).copyWith(
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
