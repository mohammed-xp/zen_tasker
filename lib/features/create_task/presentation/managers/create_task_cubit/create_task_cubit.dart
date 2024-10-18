import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zen_tasker/core/models/task_model.dart';
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
        DateTime combinedDateTime = _combinedDateAndTime(
          date: taskModel.date,
          time: taskModel.time,
        );
        await LocalNotificationService.scheduleNotification(
          task.key,
          taskModel.title,
          taskModel.description,
          combinedDateTime,
        );
        emit(CreateTaskSuccess());
      },
    );
  }

  /// Combine a date string and a time string into a single DateTime object.
  ///
  /// The date string is expected to be in the format "yyyy-MM-dd".
  /// The time string is expected to be in the format "HH:mm:ss".
  ///
  /// Returns a DateTime object that represents the combined date and time.
  DateTime _combinedDateAndTime({required String date, required String time}) {
    DateTime parsedDate = DateTime.parse(date);

    // تحليل الوقت من String (والذي تم تحويله من DateTime سابقاً)
    List<String> timeComponents = time.split(' ')[1].split(':');
    int hour = int.parse(timeComponents[0]);
    int minute = int.parse(timeComponents[1]);
    int second = int.parse(timeComponents[2].split('.')[0]);

    // دمج التاريخ والوقت في كائن DateTime واحد
    DateTime combinedDateTime = DateTime(
      parsedDate.year,
      parsedDate.month,
      parsedDate.day,
      hour,
      minute,
      second,
    );

    return combinedDateTime;
  }
}
