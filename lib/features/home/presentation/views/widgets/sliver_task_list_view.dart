import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zen_tasker/core/helper_function/is_tablet.dart';
import 'package:zen_tasker/core/models/task_model.dart';
import 'package:zen_tasker/core/utils/size_config.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/custom_not_found_widget.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/sliver_tasks_grid_view_tablet_layout.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/sliver_tasks_list_view_mobile_layout.dart';

class SliverTaskListView extends StatelessWidget {
  const SliverTaskListView({
    super.key,
    required this.tasks,
  });

  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty
        ? SliverToBoxAdapter(
            child: Column(
              children: [
                if (!isMobile(context))
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .2,
                  ),
                const CustomNotFoundWidget(),
              ],
            ),
          )
        : MediaQuery.sizeOf(context).width < SizeConfig.tablet
            ? SliverTasksListViewMobileLayout(tasks: tasks)
            : SliverTasksGridViewTabletLayout(tasks: tasks);
  }
}
