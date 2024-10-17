import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zen_tasker/core/models/task_model.dart';
import 'package:zen_tasker/features/home/presentation/managers/fetch_tasks_cubit/fetch_tasks_cubit.dart';
import 'package:zen_tasker/features/home/presentation/managers/update_task_cubit/update_task_cubit.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/task_done_item.dart';

class SliverTasksGridViewTabletLayout extends StatelessWidget {
  const SliverTasksGridViewTabletLayout({
    super.key,
    required this.tasks,
  });

  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: tasks.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
        childAspectRatio: 3 / 2,
      ),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 24, top: 24),
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
