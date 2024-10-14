part of 'update_task_cubit.dart';

@immutable
sealed class UpdateTaskState {}

final class UpdateTaskInitial extends UpdateTaskState {}

final class UpdateTaskLoading extends UpdateTaskState {}

final class UpdateTaskSuccess extends UpdateTaskState {}

final class UpdateTaskFailure extends UpdateTaskState {
  final String message;

  UpdateTaskFailure({required this.message});
}
