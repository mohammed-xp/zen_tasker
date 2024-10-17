import 'package:flutter/material.dart';
import 'package:zen_tasker/core/models/task_model.dart';
import 'package:zen_tasker/core/widgets/custom_app_bar.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/details_view_body.dart';
import 'package:zen_tasker/generated/l10n.dart';

class DetailsView extends StatelessWidget {
  const DetailsView(TaskModel taskModel, {super.key});

  static const routeName = 'details';

  @override
  Widget build(BuildContext context) {
    TaskModel taskModel =
        ModalRoute.of(context)!.settings.arguments as TaskModel;
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).details,
      ),
      body: DetailsViewBody(
        taskModel: taskModel,
      ),
    );
  }
}
