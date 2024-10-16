import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zen_tasker/core/models/task_model.dart';
import 'package:zen_tasker/features/home/data/repos/task_repo.dart';

part 'fetch_tasks_state.dart';

class FetchTasksCubit extends Cubit<FetchTasksState> {
  FetchTasksCubit(this.taskRepo) : super(FetchTasksInitial());

  final TaskRepo taskRepo;

  List<TaskModel> allTasks = [];

  List<TaskModel> filteredTasks = [];

  Future<void> fetchAllTasks() async {
    emit(FetchTasksLoading());

    final result = await taskRepo.fetchAllTasks();

    result.fold(
      (failure) {
        emit(FetchTasksFailure(message: failure.message));
      },
      (tasks) {
        allTasks = tasks
          ..sort((a, b) {
            int isDoneComparison =
                a.isDone == b.isDone ? 0 : (a.isDone ? 1 : -1);
            if (isDoneComparison == 0) {
              int dateComparison = a.date.compareTo(b.date);
              if (dateComparison == 0) {
                return a.time.compareTo(b.time);
              } else {
                return dateComparison;
              }
            } else {
              return isDoneComparison;
            }
          });

        filteredTasks = allTasks;
        emit(FetchTasksSuccess());
      },
    );
  }

  void searchTasks(String query) {
    if (query.isEmpty) {
      filteredTasks = allTasks;
    } else {
      filteredTasks = allTasks
          .where(
              (task) => task.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    emit(FetchTasksSuccess());
  }
}
