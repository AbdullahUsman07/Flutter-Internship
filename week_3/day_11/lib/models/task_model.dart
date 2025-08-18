

import 'package:get/get.dart';

class Task {
  String title;
  DateTime dueDate;
  RxBool isCompleted;
  String description;
  String category;
  String priority;

  Task({
    required this.title,
    required this.dueDate,
    bool isCompleted = false,
    required this.description,
    this.category = 'none',
    this.priority = 'low',
  }) : isCompleted = isCompleted.obs;
}
