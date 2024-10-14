import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zen_tasker/constants.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';
import 'package:zen_tasker/core/widgets/custom_progress.dart';
import 'package:zen_tasker/features/home/presentation/managers/fetch_tasks_cubit/fetch_tasks_cubit.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/custom_error_widget.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/custom_not_found_widget.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/custom_search_text_field.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/header_home_body.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/percent_indicator_widget.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/sliver_task_list_view.dart';
import 'package:zen_tasker/generated/l10n.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchTasksCubit, FetchTasksState>(
      builder: (context, state) {
        var tasks = 0;
        var isDone = 0;
        if (state is FetchTasksSuccess) {
          tasks = state.tasks.length;
          isDone = state.tasks.where((element) => element.isDone).length;
        }
        return CustomProgress(
          isLoading: state is FetchTasksLoading,
          child: state is FetchTasksSuccess
              ? state.tasks.isEmpty
                  ? const CustomNotFoundWidget()
                  : Padding(
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
                                const CustomSearchTextField(),
                                const SizedBox(
                                  height: 24,
                                ),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    PercentIndicatorWidget(
                                      percent: isDone / tasks,
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          S.of(context).myTask,
                                          style: AppStyles.styleSemiBold20(
                                              context),
                                        ),
                                        Text(
                                          '${isDone} to ${tasks} tasks',
                                          style:
                                              AppStyles.styleMedium16(context)
                                                  .copyWith(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                          ),
                          SliverTaskListView(
                            tasks: state.tasks,
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
