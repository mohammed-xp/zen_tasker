part of 'create_task_cubit.dart';

@immutable
sealed class CreateTaskState {}

final class CreateTaskInitial extends CreateTaskState {}

final class CreateTaskLoading extends CreateTaskState {}

final class CreateTaskError extends CreateTaskState {
  final String error;
  CreateTaskError({required this.error});
}

final class CreateTaskSuccess extends CreateTaskState {}
