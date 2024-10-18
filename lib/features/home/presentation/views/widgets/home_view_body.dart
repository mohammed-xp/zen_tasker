import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zen_tasker/constants.dart';
import 'package:zen_tasker/core/helper_function/is_tablet.dart';
import 'package:zen_tasker/core/utils/size_config.dart';
import 'package:zen_tasker/core/widgets/custom_progress.dart';
import 'package:zen_tasker/features/home/presentation/managers/fetch_tasks_cubit/fetch_tasks_cubit.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/custom_error_widget.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/header_home_body.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/search_and_percent_mobile_layout_section.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/search_and_percent_tablet_layout_section.dart';
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
    // FocusManager.instance.primaryFocus?.unfocus();
    // FocusScope.of(context).unfocus();
    searchController.dispose();

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
                            SizedBox(
                              height: isMobile(context) ? 16 : 32,
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
