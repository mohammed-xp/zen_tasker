import 'package:flutter/material.dart';
import 'package:zen_tasker/core/helper_function/format_date.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';
import 'package:zen_tasker/generated/l10n.dart';

class HeaderHomeBody extends StatelessWidget {
  const HeaderHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateTime.now().hour >= 12
              ? S.of(context).goodEvening
              : S.of(context).goodMorning,
          style: AppStyles.styleBold23(context),
        ),
        Text(
          formatDate(date: DateTime.now()),
          style: AppStyles.styleRegular13(context),
        ),
      ],
    );
  }
}
