import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zen_tasker/core/helper_function/is_tablet.dart';
import 'package:zen_tasker/core/services/get_it_service.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: isMobile(context) ? null : 80,
          title: Text(
            S.of(context).addTask,
            style: isMobile(context)
                ? AppStyles.styleBold18(context)
                : AppStyles.styleBold35(context),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
              size: isMobile(context) ? null : 40,
            ),
          ),
        ),
        body: const CreateTaskViewBodyBloc(),
      ),
    );
  }
}
