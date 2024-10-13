import 'package:flutter/material.dart';
import 'package:zen_tasker/constants.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/custom_search_text_field.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/header_home_body.dart';
import 'package:zen_tasker/features/home/presentation/views/widgets/task_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderHomeBody(),
                SizedBox(
                  height: 24,
                ),
                CustomSearchTextField(),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: TaskItem(
              onChecked: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
