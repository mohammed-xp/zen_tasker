import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zen_tasker/constants.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';
import 'package:zen_tasker/core/widgets/custom_progress.dart';
import 'package:zen_tasker/features/home/presentation/managers/fetch_tasks_cubit/fetch_tasks_cubit.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/custom_error_widget.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/custom_search_text_field.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/header_home_body.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/percent_indicator_widget.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/sliver_task_list_view.dart';
import 'package:zen_tasker/generated/l10n.dart';

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
    return BlocConsumer<FetchTasksCubit, FetchTasksState>(
      listener: (context, state) {},
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
                            CustomSearchTextField(
                              controller: searchController,
                              onChanged: (value) {
                                BlocProvider.of<FetchTasksCubit>(context)
                                    .searchTasks(value);
                              },
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                PercentIndicatorWidget(
                                  percent: isDoneLength / tasksLength,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      S.of(context).myTask,
                                      style: AppStyles.styleSemiBold20(context),
                                    ),
                                    Text.rich(
                                      TextSpan(children: [
                                        TextSpan(
                                          text: '$isDoneLength',
                                        ),
                                        TextSpan(
                                          text: ' ${S.of(context).kOf} ',
                                        ),
                                        TextSpan(
                                          text: '$tasksLength',
                                        ),
                                        TextSpan(
                                          text: ' ${S.of(context).tasks}',
                                        ),
                                      ]),
                                      style: AppStyles.styleMedium16(context)
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
