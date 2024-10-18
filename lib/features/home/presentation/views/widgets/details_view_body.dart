import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zen_tasker/constants.dart';
import 'package:zen_tasker/core/helper_function/build_toast.dart';
import 'package:zen_tasker/core/helper_function/custom_show_dialog.dart';
import 'package:zen_tasker/core/helper_function/format_date.dart';
import 'package:zen_tasker/core/helper_function/format_time.dart';
import 'package:zen_tasker/core/helper_function/is_tablet.dart';
import 'package:zen_tasker/core/models/task_model.dart';
import 'package:zen_tasker/core/widgets/custom_button.dart';
import 'package:zen_tasker/features/home/presentation/managers/delete_task_cubit/delete_task_cubit.dart';
import 'package:zen_tasker/features/home/presentation/managers/fetch_tasks_cubit/fetch_tasks_cubit.dart';
import 'package:zen_tasker/features/home/presentation/views/edit_view.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/custom_lable_and_state.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/custom_lable_and_text.dart';
import 'package:zen_tasker/generated/l10n.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.taskModel});

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding, vertical: 8),
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
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      end: MediaQuery.sizeOf(context).width * .2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomLableAndText(
                        lable: S.of(context).date,
                        text: formatDate(date: DateTime.parse(taskModel.date)),
                      ),
                      CustomLableAndText(
                        lable: S.of(context).time,
                        text: formatTime(
                            dateTime: DateTime.parse(taskModel.time)),
                      ),
                    ],
                  ),
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
                if (isMobile(context))
                  Column(
                    children: [
                      CustomButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            EditView.routeName,
                            arguments: taskModel,
                          );
                        },
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
                            customShowDialog(
                              context,
                              title: S.of(context).warning,
                              message: S.of(context).messageAlertToDelete,
                              confirmText: S.of(context).delete,
                              onConfirm: () {
                                context
                                    .read<DeleteTaskCubit>()
                                    .deleteTask(taskModel: taskModel);
                              },
                            );
                          }
                        },
                        text: S.of(context).delete,
                        backgroundColor: Colors.red,
                        icon: Icons.delete,
                      ),
                    ],
                  ),
                if (!isMobile(context))
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            EditView.routeName,
                            arguments: taskModel,
                          );
                        },
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
                            customShowDialog(
                              context,
                              title: S.of(context).warning,
                              message: S.of(context).messageAlertToDelete,
                              confirmText: S.of(context).delete,
                              onConfirm: () {
                                context
                                    .read<DeleteTaskCubit>()
                                    .deleteTask(taskModel: taskModel);
                                Navigator.pop(context);
                                context.read<FetchTasksCubit>().fetchAllTasks();

                                Navigator.pop(context);
                              },
                            );
                          }
                        },
                        text: S.of(context).delete,
                        backgroundColor: Colors.red,
                        icon: Icons.delete,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
