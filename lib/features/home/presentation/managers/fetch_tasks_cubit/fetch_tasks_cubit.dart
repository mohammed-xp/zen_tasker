import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zen_tasker/core/models/task_model.dart';
import 'package:zen_tasker/features/home/data/repos/task_repo.dart';

part 'fetch_tasks_state.dart';

class FetchTasksCubit extends Cubit<FetchTasksState> {
  FetchTasksCubit(this.taskRepo) : super(FetchTasksInitial());

  final TaskRepo taskRepo;

  Future<void> fetchAllTasks() async {
    emit(FetchTasksLoading());

    final result = await taskRepo.fetchAllTasks();

    result.fold(
      (failure) {
        emit(FetchTasksFailure(message: failure.message));
      },
      (tasks) {
        log('tasks: $tasks');
        emit(FetchTasksSuccess(tasks: tasks));
      },
    );
  }
}
