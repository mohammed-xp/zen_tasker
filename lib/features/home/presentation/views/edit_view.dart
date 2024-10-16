import 'package:flutter/material.dart';
import 'package:zen_tasker/core/models/task_model.dart';
import 'package:zen_tasker/core/widgets/custom_app_bar.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/edit_view_body.dart';
import 'package:zen_tasker/generated/l10n.dart';

class EditView extends StatelessWidget {
  const EditView(TaskModel taskModel, {super.key});

  static const routeName = 'edit_view';

  @override
  Widget build(BuildContext context) {
    TaskModel taskModel =
        ModalRoute.of(context)!.settings.arguments as TaskModel;
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).details,
      ),
      body: EditViewBody(taskModel: taskModel),
    );
  }
}
