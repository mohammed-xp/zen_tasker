import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zen_tasker/core/models/task_model.dart';
import 'package:zen_tasker/features/home/data/repos/task_repo.dart';

part 'delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  DeleteTaskCubit(this.taskRepo) : super(DeleteTaskInitial());

  final TaskRepo taskRepo;

  void deleteTask({required TaskModel taskModel}) async {
    emit(DeleteTaskLoading());

    final result = await taskRepo.deleteTask(taskModel: taskModel);
    result.fold(
      (failure) {
        emit(DeleteTaskFailure(message: failure.message));
      },
      (success) {
        emit(DeleteTaskSuccess());
      },
    );
  }

  void deleteAllTasks({required List<TaskModel> tasks}) async {
    emit(DeleteTaskLoading());

    final result = await taskRepo.deleteAllTasks(tasks: tasks);
    result.fold(
      (failure) {
        emit(DeleteTaskFailure(message: failure.message));
      },
      (success) {
        emit(DeleteTaskSuccess());
      },
    );
  }
}
