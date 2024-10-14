import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zen_tasker/core/models/task_model.dart';
import 'package:zen_tasker/features/home/data/repos/task_repo.dart';

part 'update_task_state.dart';

class UpdateTaskCubit extends Cubit<UpdateTaskState> {
  UpdateTaskCubit(this.taskRepo) : super(UpdateTaskInitial());

  final TaskRepo taskRepo;

  Future<void> updateDoneTask({required TaskModel taskModel}) async {
    emit(UpdateTaskLoading());
    taskModel.isDone = !taskModel.isDone;
    final result = await taskRepo.updateTask(taskModel: taskModel);
    result.fold(
      (failure) {
        emit(UpdateTaskFailure(message: failure.message));
      },
      (success) {
        emit(UpdateTaskSuccess());
      },
    );
  }
}
