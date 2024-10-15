import 'package:flutter/material.dart';
import 'package:zen_tasker/core/models/task_model.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          S.of(context).details,
          style: AppStyles.styleBold18(context),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: EditViewBody(taskModel: taskModel),
    );
  }
}
