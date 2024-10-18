import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zen_tasker/core/helper_function/combined_date_and_time.dart';
import 'package:zen_tasker/core/models/task_model.dart';
import 'package:zen_tasker/core/services/device_calendar_service.dart';
import 'package:zen_tasker/core/services/local_notification_service.dart';
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
      (task) async {
        DateTime combinedDateTime = combinedDateAndTime(
          date: taskModel.date,
          time: taskModel.time,
        );
        await LocalNotificationService.scheduleNotification(
          task.key,
          taskModel.title,
          taskModel.description,
          combinedDateTime,
        );

        await DeviceCalendarService.createEvent(
          title: task.title,
          description: task.description,
          endDate: combinedDateTime,
        );
        emit(CreateTaskSuccess());
      },
    );
  }
}
