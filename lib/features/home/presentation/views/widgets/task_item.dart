import 'package:flutter/material.dart';
import 'package:zen_tasker/core/utils/app_colors.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/custom_check_box.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({super.key, required this.onChecked});

  final ValueChanged<bool> onChecked;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool isTaskDone = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 153,
      width: 378,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black.withOpacity(0.05000000074505806),
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 16,
            offset: Offset(3, 3),
            spreadRadius: 3,
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              CustomCheckBox(
                isChecked: isTaskDone,
                onChecked: (value) {
                  isTaskDone = value;
                  widget.onChecked(value);
                  setState(() {});
                },
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Task Title',
                    style: AppStyles.styleMedium16(context),
                  ),
                  Text(
                    'Task Description',
                    style: AppStyles.styleRegular13(context),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Divider(
            color: Color(0xFFBFBFBF),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.access_time_rounded,
                color: AppColors.primaryColor,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                '10:00 AM',
                style: AppStyles.styleRegular13(context).copyWith(
                  color: const Color(0xFF363841),
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.calendar_month_rounded,
                color: AppColors.primaryColor,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                'Oct 26, 2022',
                style: AppStyles.styleRegular13(context).copyWith(
                  color: const Color(0xFF363841),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
