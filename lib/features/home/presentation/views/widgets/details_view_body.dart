import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:zen_tasker/constants.dart';
import 'package:zen_tasker/core/helper_function/format_date.dart';
import 'package:zen_tasker/core/helper_function/format_time.dart';
import 'package:zen_tasker/core/models/task_model.dart';
import 'package:zen_tasker/core/utils/app_colors.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';
import 'package:zen_tasker/core/widgets/custom_button.dart';
import 'package:zen_tasker/features/home/presentation/managers/delete_task_cubit/delete_task_cubit.dart';
import 'package:zen_tasker/features/home/presentation/managers/fetch_tasks_cubit/fetch_tasks_cubit.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/custom_lable_and_state.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/custom_lable_and_text.dart';
import 'package:zen_tasker/generated/l10n.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.taskModel});

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomLableAndText(
                  lable: S.of(context).title,
                  text: taskModel.title,
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomLableAndText(
                      lable: S.of(context).date,
                      text: formatDate(date: DateTime.parse(taskModel.date)),
                    ),
                    CustomLableAndText(
                      lable: S.of(context).time,
                      text:
                          formatTime(dateTime: DateTime.parse(taskModel.date)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomLableAndText(
                  lable: S.of(context).description,
                  text: taskModel.description,
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomLableAndState(
                  label: S.of(context).state,
                  state: taskModel.isDone,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Spacer(),
                CustomButton(
                  onPressed: () {},
                  text: S.of(context).edit,
                  icon: Icons.edit,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomButton(
                  onPressed: () {
                    if (taskModel.isDone) {
                      context
                          .read<DeleteTaskCubit>()
                          .deleteTask(taskModel: taskModel);
                      context.read<FetchTasksCubit>().fetchAllTasks();
                      Navigator.pop(context);
                    } else {
                      Alert(
                        context: context,
                        type: AlertType.warning,
                        title: S.of(context).warning,
                        desc: S.of(context).messageAlertToDelete,
                        closeIcon: const SizedBox(),
                        buttons: [
                          DialogButton(
                            onPressed: () => Navigator.pop(context),
                            color: Colors.red,
                            child: Text(
                              S.of(context).delete,
                              style: AppStyles.styleMedium20(context).copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          DialogButton(
                            onPressed: () => Navigator.pop(context),
                            color: AppColors.primaryColor,
                            child: Text(
                              S.of(context).cancel,
                              style: AppStyles.styleMedium20(context).copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ).show();
                    }
                  },
                  text: S.of(context).delete,
                  backgroundColor: Colors.red,
                  icon: Icons.delete,
                ),
                const SizedBox(
                  height: 8,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
