import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zen_tasker/features/home/presentation/managers/fetch_tasks_cubit/fetch_tasks_cubit.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/custom_search_text_field.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/percent_indicator_and_my_tasks_section.dart';

class SearchAndPercentMobileLayoutSection extends StatelessWidget {
  const SearchAndPercentMobileLayoutSection({
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
    return Column(
      children: [
        CustomSearchTextField(
          controller: searchController,
          onChanged: (value) {
            BlocProvider.of<FetchTasksCubit>(context).searchTasks(value);
          },
        ),
        const SizedBox(
          height: 24,
        ),
        PercentIndicatorAndMyTasksSection(
          isDoneLength: isDoneLength,
          tasksLength: tasksLength,
        ),
      ],
    );
  }
}
