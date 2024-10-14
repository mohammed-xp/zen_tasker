import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zen_tasker/core/widgets/custom_progress.dart';
import 'package:zen_tasker/features/home/presentation/managers/fetch_tasks_cubit/fetch_tasks_cubit.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/custom_error_widget.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/custom_not_found_widget.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/task_done_item.dart';

class SliverTaskListView extends StatelessWidget {
  const SliverTaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: BlocBuilder<FetchTasksCubit, FetchTasksState>(
        builder: (context, state) {
          return CustomProgress(
            isLoading: state is FetchTasksLoading,
            child: state is FetchTasksSuccess
                ? state.tasks.isEmpty
                    ? const CustomNotFoundWidget()
                    : ListView.builder(
                        itemCount: state.tasks.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: TaskDoneItem(
                            taskModel: state.tasks[index],
                            onChecked: (bool value) {
                              var task = state.tasks[index];

                              // context.read<DeleteTaskCubit>().updateTask(
                              //       taskModel: state.tasks[index],
                              //       isChecked: value,
                              //     );
                            },
                          ),
                        ),
                      )
                : const CustomErrorWidget(),
          );
        },
      ),
    );
  }
}
