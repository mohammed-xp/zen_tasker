part of 'tasks_cubit.dart';

@immutable
sealed class TasksState {}

final class TasksInitial extends TasksState {}

final class TasksChangeLanguage extends TasksState {
  final Locale locale;
  TasksChangeLanguage({required this.locale});
}
