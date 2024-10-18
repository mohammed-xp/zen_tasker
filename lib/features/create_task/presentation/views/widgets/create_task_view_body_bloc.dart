import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zen_tasker/core/helper_function/build_toast.dart';
import 'package:zen_tasker/core/widgets/custom_progress.dart';
import 'package:zen_tasker/features/create_task/presentation/managers/create_task_cubit/create_task_cubit.dart';
import 'package:zen_tasker/features/create_task/presentation/views/widgets/create_task_view_body.dart';
import 'package:zen_tasker/features/home/presentation/managers/fetch_tasks_cubit/fetch_tasks_cubit.dart';

class CreateTaskViewBodyBloc extends StatelessWidget {
  const CreateTaskViewBodyBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateTaskCubit, CreateTaskState>(
      listener: (context, state) {
        if (state is CreateTaskSuccess) {
          BlocProvider.of<FetchTasksCubit>(context).fetchAllTasks();
          Navigator.pop(context);
        }

        if (state is CreateTaskError) {
          buildToast(
            context,
            message: state.error,
            state: ToastStates.ERROR,
          );
        }
      },
      builder: (context, state) {
        return CustomProgress(
          isLoading: state is CreateTaskLoading ? true : false,
          child: const CreateTaskViewBody(),
        );
      },
    );
  }
}
