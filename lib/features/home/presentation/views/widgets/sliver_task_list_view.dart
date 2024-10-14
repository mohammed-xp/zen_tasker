import 'package:flutter/material.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/task_item.dart';

class SliverTaskListView extends StatelessWidget {
  const SliverTaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 4,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: TaskItem(
          onChecked: (bool value) {},
        ),
      ),
    );
  }
}
