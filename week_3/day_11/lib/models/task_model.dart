

import 'package:get/get.dart';

class Task {
  String title;
  DateTime dueDate;
  RxBool isCompleted;
  String description;

  Task({
    required this.title,
    required this.dueDate,
    bool isCompleted = false,
    required this.description,
  }) : isCompleted = isCompleted.obs;
}
