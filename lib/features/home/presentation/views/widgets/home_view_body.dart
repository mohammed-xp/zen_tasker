import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zen_tasker/constants.dart';
import 'package:zen_tasker/core/utils/size_config.dart';
import 'package:zen_tasker/core/widgets/custom_progress.dart';
import 'package:zen_tasker/features/home/presentation/managers/fetch_tasks_cubit/fetch_tasks_cubit.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/custom_error_widget.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/custom_search_text_field.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/header_home_body.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/percent_indicator_and_my_tasks_section.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/search_and_percent_mobile_layout_section.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/sliver_task_list_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    // FocusManager.instance.primaryFocus?.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchTasksCubit, FetchTasksState>(
      builder: (context, state) {
        var tasks = BlocProvider.of<FetchTasksCubit>(context).allTasks;
        var tasksLength = 0;
        var isDoneLength = 0;
        if (state is FetchTasksSuccess) {
          tasksLength = tasks.length;
          isDoneLength = tasks.where((element) => element.isDone).length;
          // BlocProvider.of<FetchTasksCubit>(context).filteredTasks = tasks;
        }
        return CustomProgress(
          isLoading: state is FetchTasksLoading,
          child: state is FetchTasksSuccess
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kHorizontalPadding),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const HeaderHomeBody(),
                            const SizedBox(
                              height: 24,
                            ),
                            MediaQuery.sizeOf(context).width < SizeConfig.tablet
                                ? SearchAndPercentMobileLayoutSection(
                                    searchController: searchController,
                                    isDoneLength: isDoneLength,
                                    tasksLength: tasksLength,
                                  )
                                : SearchAndPercentTabletLayoutSection(
                                    searchController: searchController,
                                    isDoneLength: isDoneLength,
                                    tasksLength: tasksLength,
                                  ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                      SliverTaskListView(
                        tasks: BlocProvider.of<FetchTasksCubit>(context)
                            .filteredTasks,
                      ),
                    ],
                  ),
                )
              : const CustomErrorWidget(),
        );
      },
    );
  }
}

class SearchAndPercentTabletLayoutSection extends StatelessWidget {
  const SearchAndPercentTabletLayoutSection({
    super.key,
    required this.searchController,
    required this.isDoneLength,
    required this.tasksLength,
  });

  final TextEditingController searchController;
  final int isDoneLength;
  final int tasksLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: CustomSearchTextField(
            controller: searchController,
            onChanged: (value) {
              BlocProvider.of<FetchTasksCubit>(context).searchTasks(value);
            },
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 2,
          child: PercentIndicatorAndMyTasksSection(
            isDoneLength: isDoneLength,
            tasksLength: tasksLength,
          ),
        ),
      ],
    );
  }
}
