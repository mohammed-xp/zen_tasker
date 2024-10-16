import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zen_tasker/core/models/task_model.dart';
import 'package:zen_tasker/features/home/presentation/managers/fetch_tasks_cubit/fetch_tasks_cubit.dart';
import 'package:zen_tasker/features/home/presentation/managers/update_task_cubit/update_task_cubit.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/custom_not_found_widget.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/task_done_item.dart';

class SliverTaskListView extends StatelessWidget {
  const SliverTaskListView({
    super.key,
    required this.tasks,
  });

  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty
        ? const SliverToBoxAdapter(child: CustomNotFoundWidget())
        : SliverList.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: BlocBuilder<UpdateTaskCubit, UpdateTaskState>(
                builder: (context, state) {
                  return TaskDoneItem(
                    taskModel: tasks[index],
                    isTaskDone: tasks[index].isDone,
                    onChecked: (value) {
                      BlocProvider.of<UpdateTaskCubit>(context)
                          .updateDoneTask(taskModel: tasks[index]);
                      BlocProvider.of<FetchTasksCubit>(context).fetchAllTasks();
                    },
                  );
                },
              ),
            ),
          );
  }
}
