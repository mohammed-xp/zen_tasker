import 'package:dartz/dartz.dart';
import 'package:zen_tasker/core/errors/failure.dart';
import 'package:zen_tasker/core/models/task_model.dart';

abstract class CreateTaskRepo {
  Future<Either<Failure, TaskModel>> createTask({required TaskModel taskModel});
}
