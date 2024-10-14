import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:zen_tasker/constants.dart';
import 'package:zen_tasker/core/errors/failure.dart';
import 'package:zen_tasker/core/models/task_model.dart';
import 'package:zen_tasker/features/home/data/repos/task_repo.dart';

class TaskRepoImpl implements TaskRepo {
  @override
  Future<Either<Failure, List<TaskModel>>> fetchAllTasks() async {
    try {
      var taskBox = Hive.box<TaskModel>(kTasksBox);

      List<TaskModel> tasks = taskBox.values.toList();

      return right(tasks);
    } catch (e) {
      log('Exception in FetchTaskRepoImpl.fetchTasks: ${e.toString()}');
      return left(LocalFailure(e.toString()));
    }
  }
}
