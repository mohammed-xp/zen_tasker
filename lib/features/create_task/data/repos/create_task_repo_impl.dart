import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zen_tasker/constants.dart';
import 'package:zen_tasker/core/errors/failure.dart';
import 'package:zen_tasker/core/models/task_model.dart';
import 'package:zen_tasker/features/create_task/data/repos/create_task_repo.dart';

class CreateTaskRepoImpl implements CreateTaskRepo {
  @override
  Future<Either<Failure, TaskModel>> createTask({
    required TaskModel taskModel,
  }) async {
    try {
      var taskBox = Hive.box<TaskModel>(kTasksBox);

      await taskBox.add(taskModel);

      return right(taskModel);
    } catch (e) {
      log('Exception in CreateTaskRepoImpl.createTask: ${e.toString()}');
      return left(LocalFailure(e.toString()));
    }
  }
}
