import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zen_tasker/core/widgets/alert_dialog_widget.dart';
import 'package:zen_tasker/core/widgets/custom_title_text.dart';
import 'package:zen_tasker/features/home/presentation/managers/delete_task_cubit/delete_task_cubit.dart';
import 'package:zen_tasker/features/home/presentation/managers/fetch_tasks_cubit/fetch_tasks_cubit.dart';
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
        backgroundColor: Colors.white,
        title: const CustomTitleText(
          fontSize: 24,
        ),
        elevation: 0,
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                child: LableMenuItem(
                  text: S.of(context).changeLanguage,
                  icon: Icons.translate_rounded,
                ),
                onTap: () {
                  print('-------------- change language');
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
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialogWidget(
                        title: S.of(context).warning,
                        confirmText: S.of(context).deleteAll,
                        message: S.of(context).messageAlertToDeleteAllTasks,
                        onConfirm: () {
                          BlocProvider.of<DeleteTaskCubit>(context)
                              .deleteAllTasks(
                            tasks: BlocProvider.of<FetchTasksCubit>(context)
                                .allTasks,
                          );
                          Navigator.pop(context);
                        },
                      );
                    },
                    barrierDismissible: false,
                  );
                },
              ),
            ],
          )
        ],
      ),
      body: const HomeViewBody(),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}
