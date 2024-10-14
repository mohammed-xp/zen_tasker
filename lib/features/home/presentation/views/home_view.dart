import 'package:flutter/material.dart';
import 'package:zen_tasker/core/utils/app_colors.dart';
import 'package:zen_tasker/core/widgets/custom_title_text.dart';
import 'package:zen_tasker/features/create_task/presentation/views/create_task_view.dart';
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
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: const HomeViewBody(),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            CreateTaskView.routeName,
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            // color: AppColors.primaryColor,
            gradient: LinearGradient(
              begin: Alignment(1.00, -0.08),
              end: Alignment(-1, 0.08),
              colors: [AppColors.primaryColor, AppColors.lightPrimaryColor],
            ),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
    );
  }
}
