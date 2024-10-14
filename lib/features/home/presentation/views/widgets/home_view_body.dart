import 'package:flutter/material.dart';
import 'package:zen_tasker/constants.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/custom_search_text_field.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/header_home_body.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/sliver_task_list_view.dart';
import 'package:zen_tasker/generated/l10n.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
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
                Text(
                  S.of(context).myTask,
                  style: AppStyles.styleSemiBold20(context),
                ),
                Text(
                  '${3} of ${5} task',
                  style: AppStyles.styleMedium16(context).copyWith(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          const SliverTaskListView(),
        ],
      ),
    );
  }
}
