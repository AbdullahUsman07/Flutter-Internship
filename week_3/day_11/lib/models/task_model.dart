

import 'package:get/get.dart';

class Task {
  String? id;  // this will be the auto-id assigned by the firestore
  String title;
  DateTime dueDate;
  RxBool isCompleted;
  String description;
  String category;
  String priority;

  Task({
    this.id,
    required this.title,
    required this.dueDate,
    bool isCompleted = false,
    required this.description,
    this.category = 'none',
    this.priority = 'low',
  }) : isCompleted = isCompleted.obs;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
      'isCompleted': isCompleted.value,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json, String id) {
    return Task(
      id: id,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      dueDate: DateTime.parse(json['dueDate']),
      isCompleted: json['isCompleted'] ?? false,
    );
  }
  
}
