import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zen_tasker/core/helper_function/build_toast.dart';
import 'package:zen_tasker/core/helper_function/custom_show_dialog.dart';
import 'package:zen_tasker/core/helper_function/is_tablet.dart';
import 'package:zen_tasker/core/widgets/custom_title_text.dart';
import 'package:zen_tasker/features/home/presentation/managers/delete_task_cubit/delete_task_cubit.dart';
import 'package:zen_tasker/features/home/presentation/managers/fetch_tasks_cubit/fetch_tasks_cubit.dart';
import 'package:zen_tasker/features/home/presentation/managers/tasks_cubit/tasks_cubit.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/custom_floating_action_button.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/lable_menu_item.dart';
import 'package:zen_tasker/generated/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: isMobile(context) ? null : 80,
        backgroundColor: Colors.white,
        title: CustomTitleText(
          fontSize: isMobile(context) ? 24 : 34,
        ),
        elevation: 0,
        actions: [
          PopupMenuButton<String>(
            // icon: const Icon(Icons.more_vert_rounded),
            iconSize: isMobile(context) ? null : 45,
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                child: LableMenuItem(
                  text: S.of(context).changeLanguage,
                  icon: Icons.translate_rounded,
                ),
                onTap: () {
                  context.read<TasksCubit>().changeLanguage(context);
                },
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                enabled: BlocProvider.of<FetchTasksCubit>(context)
                    .allTasks
                    .isNotEmpty,
                child: LableMenuItem(
                  text: S.of(context).deleteAll,
                  icon: Icons.delete_sweep_rounded,
                  color: Colors.redAccent,
                ),
                onTap: () {
                  customShowDialog(
                    context,
                    title: S.of(context).warning,
                    confirmText: S.of(context).deleteAll,
                    message: S.of(context).messageAlertToDeleteAllTasks,
                    onConfirm: () {
                      var tasks = context.read<FetchTasksCubit>().allTasks;
                      context.read<DeleteTaskCubit>().deleteAllTasks(
                            tasks: tasks,
                          );
                      // context.read<FetchTasksCubit>().fetchAllTasks();
                      // Navigator.pushReplacementNamed(
                      //     context, HomeView.routeName);
                    },
                  );
                },
              ),
            ],
          )
        ],
      ),
      body: BlocConsumer<DeleteTaskCubit, DeleteTaskState>(
        listener: (context, state) {
          if (state is DeleteTaskSuccess) {
            buildToast(
              context,
              message: S.of(context).deletedAllTasks,
              state: ToastStates.SUCCESS,
            );
            context.read<FetchTasksCubit>().fetchAllTasks();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return const HomeViewBody();
        },
      ),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}
