import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';
import 'package:zen_tasker/generated/l10n.dart';

class HeaderHomeBody extends StatefulWidget {
  const HeaderHomeBody({super.key});

  @override
  State<HeaderHomeBody> createState() => _HeaderHomeBodyState();
}

class _HeaderHomeBodyState extends State<HeaderHomeBody> {
  late DateTime now;
  late String formattedDate;
  @override
  void initState() {
    now = DateTime.now();
    formattedDate = DateFormat('MMM dd, yyyy').format(now);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          now.hour >= 12
              ? S.of(context).goodEvening
              : S.of(context).goodMorning,
          style: AppStyles.styleBold23(context),
        ),
        Text(
          formattedDate,
          style: AppStyles.styleRegular13(context),
        ),
      ],
    );
  }
}
