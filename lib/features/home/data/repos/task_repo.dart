import 'package:dartz/dartz.dart';
import 'package:zen_tasker/core/errors/failure.dart';
import 'package:zen_tasker/core/models/task_model.dart';

abstract class TaskRepo {
  Future<Either<Failure, List<TaskModel>>> fetchAllTasks();

  Future<Either<Failure, void>> updateTask({required TaskModel taskModel});
}
