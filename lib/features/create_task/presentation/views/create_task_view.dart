import 'package:flutter/material.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';
import 'package:zen_tasker/features/create_task/presentation/views/widgets/create_task_view_body.dart';
import 'package:zen_tasker/generated/l10n.dart';

class CreateTaskView extends StatelessWidget {
  const CreateTaskView({super.key});

  static const routeName = 'create_task';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          S.of(context).addTask,
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
      body: const CreateTaskViewBody(),
    );
  }
}
