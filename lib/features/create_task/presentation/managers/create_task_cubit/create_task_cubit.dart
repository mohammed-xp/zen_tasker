import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zen_tasker/core/models/task_model.dart';
import 'package:zen_tasker/features/create_task/data/repos/create_task_repo.dart';

part 'create_task_state.dart';

class CreateTaskCubit extends Cubit<CreateTaskState> {
  CreateTaskCubit(this.createTaskRepo) : super(CreateTaskInitial());

  final CreateTaskRepo createTaskRepo;

  Future<void> createTask({required TaskModel taskModel}) async {
    emit(CreateTaskLoading());

    var result = await createTaskRepo.createTask(taskModel: taskModel);

    result.fold(
      (failure) {
        emit(CreateTaskError(error: failure.toString()));
      },
      (success) {
        emit(CreateTaskSuccess());
      },
    );
  }
}
