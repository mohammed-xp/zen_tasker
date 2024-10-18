import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zen_tasker/core/helper_function/combined_date_and_time.dart';
import 'package:zen_tasker/core/models/task_model.dart';
import 'package:zen_tasker/core/services/local_notification_service.dart';
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
        if (taskModel.isDone) {
          LocalNotificationService.cancelScheduledNotification(taskModel.key);
        } else {
          DateTime combinedDateTime = combinedDateAndTime(
            date: taskModel.date,
            time: taskModel.time,
          );
          LocalNotificationService.scheduleNotification(
            taskModel.key,
            taskModel.title,
            taskModel.description,
            combinedDateTime,
          );
        }
        emit(UpdateTaskSuccess());
      },
    );
  }

  Future<void> updateTask({required TaskModel taskModel}) async {
    emit(UpdateTaskLoading());

    final result = await taskRepo.updateTask(taskModel: taskModel);
    result.fold(
      (failure) {
        emit(UpdateTaskFailure(message: failure.message));
      },
      (success) {
        DateTime combinedDateTime = combinedDateAndTime(
          date: taskModel.date,
          time: taskModel.time,
        );
        LocalNotificationService.editScheduledNotification(
          taskModel.key,
          taskModel.title,
          taskModel.description,
          combinedDateTime,
        );
        emit(UpdateTaskSuccess());
      },
    );
  }
}
