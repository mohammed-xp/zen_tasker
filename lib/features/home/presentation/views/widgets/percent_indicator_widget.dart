import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:zen_tasker/core/utils/app_colors.dart';

class PercentIndicatorWidget extends StatefulWidget {
  const PercentIndicatorWidget({
    super.key,
    required this.percent,
  });

  final double percent;

  @override
  State<PercentIndicatorWidget> createState() => _PercentIndicatorWidgetState();
}

class _PercentIndicatorWidgetState extends State<PercentIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 20.0,
      animation: true,
      animationDuration: 1200,
      lineWidth: 5.0,
      percent: widget.percent,
      circularStrokeCap: CircularStrokeCap.round,
      restartAnimation: true,
      progressColor: AppColors.secendaryColor,
    );
  }
}
