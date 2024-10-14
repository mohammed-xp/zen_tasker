import 'package:flutter/material.dart';
import 'package:zen_tasker/features/create_task/presentation/views/create_task_view.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
