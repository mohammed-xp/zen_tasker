import 'package:flutter/material.dart';
import 'package:zen_tasker/core/helper_function/format_date.dart';
import 'package:zen_tasker/core/helper_function/format_time.dart';
import 'package:zen_tasker/core/models/task_model.dart';
import 'package:zen_tasker/core/utils/app_colors.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';
import 'package:zen_tasker/core/utils/size_config.dart';
import 'package:zen_tasker/features/home/presentation/views/details_view.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/custom_check_box.dart';

class TaskDoneItem extends StatelessWidget {
  const TaskDoneItem({
    super.key,
    required this.onChecked,
    required this.taskModel,
    required this.isTaskDone,
  });

  final ValueChanged<bool> onChecked;
  final TaskModel taskModel;
  final bool isTaskDone;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailsView.routeName,
          arguments: taskModel,
        );
      },
      child: AspectRatio(
        aspectRatio: 378 / 183,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeIn,
          decoration: BoxDecoration(
            color: isTaskDone ? AppColors.lightPrimaryColor : Colors.white,
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
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCheckBox(
                      isChecked: isTaskDone,
                      // onChecked: widget.onChecked,
                      onChecked: (value) {
                        // isTaskDone = value;
                        onChecked(value);
                        // setState(() {});
                      },
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            taskModel.title,
                            style: MediaQuery.sizeOf(context).width <
                                    SizeConfig.tablet
                                ? AppStyles.styleSemiBold20(context).copyWith(
                                    decoration: isTaskDone
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                  )
                                : AppStyles.styleSemiBold24(context).copyWith(
                                    decoration: isTaskDone
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                  ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Expanded(
                            child: Text(
                              taskModel.description,
                              style: AppStyles.styleRegular15(context).copyWith(
                                color: isTaskDone
                                    ? Colors.white.withOpacity(0.8)
                                    : null,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              // maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                  Icon(
                    Icons.access_time_rounded,
                    color: isTaskDone ? Colors.white : AppColors.primaryColor,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    // widget.taskModel.time,
                    formatTime(dateTime: DateTime.parse(taskModel.time)),
                    style: AppStyles.styleRegular13(context).copyWith(
                      color:
                          isTaskDone ? Colors.white : const Color(0xFF363841),
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.calendar_month_rounded,
                    color: isTaskDone ? Colors.white : AppColors.primaryColor,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    // widget.taskModel.date,
                    formatDate(date: DateTime.parse(taskModel.date)),
                    style: AppStyles.styleRegular13(context).copyWith(
                      color:
                          isTaskDone ? Colors.white : const Color(0xFF363841),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
