import 'package:flutter/material.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';
import 'package:zen_tasker/generated/l10n.dart';

class CustomNotFoundWidget extends StatelessWidget {
  const CustomNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: double.infinity,
          child: Icon(
            Icons.report_problem_rounded,
            color: Colors.grey,
            size: 100,
          ),
        ),
        Text(
          S.of(context).noData,
          style: AppStyles.styleSemiBold20(context).copyWith(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
