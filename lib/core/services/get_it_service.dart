import 'package:get_it/get_it.dart';
import 'package:zen_tasker/features/create_task/data/repos/create_task_repo.dart';
import 'package:zen_tasker/features/create_task/data/repos/create_task_repo_impl.dart';
import 'package:zen_tasker/features/home/data/repos/task_repo.dart';
import 'package:zen_tasker/features/home/data/repos/task_repo_impl.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<CreateTaskRepo>(CreateTaskRepoImpl());

  getIt.registerSingleton<TaskRepo>(TaskRepoImpl());
}
