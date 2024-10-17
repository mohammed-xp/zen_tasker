import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zen_tasker/core/services/get_it_service.dart';
import 'package:zen_tasker/core/widgets/custom_app_bar.dart';
import 'package:zen_tasker/features/create_task/data/repos/create_task_repo.dart';
import 'package:zen_tasker/features/create_task/presentation/managers/create_task_cubit/create_task_cubit.dart';
import 'package:zen_tasker/features/create_task/presentation/views/widgets/create_task_view_body_bloc.dart';
import 'package:zen_tasker/generated/l10n.dart';

class CreateTaskView extends StatelessWidget {
  const CreateTaskView({super.key});

  static const routeName = 'create_task';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateTaskCubit(
        getIt.get<CreateTaskRepo>(),
      ),
      child: Scaffold(
        appBar: CustomAppBar(
          title: S.of(context).addTask,
        ),
        body: const CreateTaskViewBodyBloc(),
      ),
    );
  }
}
