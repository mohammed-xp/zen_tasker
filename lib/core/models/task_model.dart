import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  String date;

  @HiveField(3)
  String time;

  @HiveField(4)
  bool isDone;

  TaskModel({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.isDone,
  });
}
