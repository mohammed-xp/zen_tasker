import 'package:flutter/material.dart';
import 'package:zen_tasker/core/models/task_model.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';
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
      body: SafeArea(
        child: DetailsViewBody(
          taskModel: taskModel,
        ),
      ),
    );
  }
}
