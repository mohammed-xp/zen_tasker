import 'package:flutter/material.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/percent_indicator_widget.dart';
import 'package:zen_tasker/generated/l10n.dart';

class PercentIndicatorAndMyTasksSection extends StatelessWidget {
  const PercentIndicatorAndMyTasksSection({
    super.key,
    required this.isDoneLength,
    required this.tasksLength,
  });

  final int isDoneLength;
  final int tasksLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PercentIndicatorWidget(
          percent: isDoneLength == 0 ? 0 : isDoneLength / tasksLength,
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).myTask,
              style: AppStyles.styleSemiBold20(context),
            ),
            Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: '$isDoneLength',
                ),
                TextSpan(
                  text: ' ${S.of(context).kOf} ',
                ),
                TextSpan(
                  text: '$tasksLength',
                ),
                TextSpan(
                  text: ' ${S.of(context).tasks}',
                ),
              ]),
              style: AppStyles.styleMedium16(context).copyWith(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
