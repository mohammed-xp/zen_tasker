import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zen_tasker/core/models/task_model.dart';

part 'delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  DeleteTaskCubit() : super(DeleteTaskInitial());

  void deleteTask({required TaskModel taskModel}) {
    emit(DeleteTaskLoading());
    taskModel.delete();
    emit(DeleteTaskSuccess());
  }
}
