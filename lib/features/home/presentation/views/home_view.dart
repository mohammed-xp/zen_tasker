import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:zen_tasker/constants.dart';
import 'package:zen_tasker/core/models/task_model.dart';
import 'package:zen_tasker/core/widgets/custom_title_text.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/custom_floating_action_button.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/home_view_body.dart';

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
          IconButton(
            onPressed: () {
              var taskBox = Hive.box<TaskModel>(kTasksBox);
              taskBox.clear();
            },
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: const HomeViewBody(),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}
