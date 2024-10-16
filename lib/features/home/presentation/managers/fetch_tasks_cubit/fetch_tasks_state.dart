part of 'fetch_tasks_cubit.dart';

@immutable
sealed class FetchTasksState {}

final class FetchTasksInitial extends FetchTasksState {}

final class FetchTasksLoading extends FetchTasksState {}

final class FetchTasksSuccess extends FetchTasksState {
  // final List<TaskModel> tasks;
  // FetchTasksSuccess({required this.tasks});
}

final class FetchTasksFailure extends FetchTasksState {
  final String message;
  FetchTasksFailure({required this.message});
}
