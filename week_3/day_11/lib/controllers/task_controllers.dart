import 'dart:async';

import 'package:day_11/models/task_model.dart';
import 'package:day_11/services/task_service.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  var allTasks = <Task>[].obs;
  var todayTasks = <Task>[].obs;
  var upcomingTasks = <Task>[].obs;
  var completedTasks = <Task>[].obs;
  var overdueTasks = <Task>[].obs;

  final TaskService _taskService = TaskService();
  StreamSubscription? _taskSubscription;

  @override
  void onInit() {
    super.onInit();
    loadTasks();

    // // Dummy data for now
    // allTasks.addAll([
    //   Task(id: '1',title: "Grocery Shopping", dueDate: DateTime(2025, 8, 18 ),description: 'task'),
    //   Task(id:'2',title: "Meeting with Alex", dueDate: DateTime(2025, 8, 18),description: 'task'),
    //   Task(id:'3',title: "Project Presentation", dueDate: DateTime(2025, 8, 18),description: 'task'),
    //   Task(id:'4',title: "Book Appointment", dueDate: DateTime(2025, 8, 20),description: 'task'),
    //   Task(id:'5',title: "Plan Vacation", dueDate: DateTime(2025, 8, 25),description: 'task'),
    //   Task(id: '6', title: "Morning Workout", dueDate: DateTime(2025, 8, 17), isCompleted: true, description: 'task'),
    //   Task(id: '7', title: "Pay Bills", dueDate: DateTime(2025, 8, 16), isCompleted: true, description: 'task'),
    // ]);

    // categorizeTasks();
  }

  void loadTasks() async {
    _taskSubscription?.cancel();
    _taskSubscription = _taskService.getTasks().listen((tasks) {
      allTasks.assignAll(tasks);
      categorizeTasks();
    });
  }

  @override
  void onClose() {
    _taskSubscription?.cancel();
    super.onClose();
  }

  void categorizeTasks() {
    final today = DateTime.now();

    todayTasks.assignAll(
      allTasks.where(
        (task) => !task.isCompleted.value && isSameDate(task.dueDate, today),
      ),
    );

    upcomingTasks.assignAll(
      allTasks.where(
        (task) => !task.isCompleted.value && task.dueDate.isAfter(today),
      ),
    );

    completedTasks.assignAll(allTasks.where((task) => task.isCompleted.value));

    overdueTasks.assignAll(
      allTasks.where(
        (task) =>
            !task.isCompleted.value &&
            task.dueDate.isBefore(DateTime(today.year, today.month, today.day)),
      ),
    );
  }

  Future<void> toggleTask(Task task) async {
    task.isCompleted.value = !task.isCompleted.value;
    await _taskService.updateTask(task);
    categorizeTasks();
  }

  Future<void> addTask(Task task) async {
    await _taskService.addTask(task);
    loadTasks();
  }

  Future<void> deleteTask(Task task) async {
    await _taskService.deleteTask(task.id!);
    allTasks.remove(task);
    categorizeTasks();
  }

  Future<void> updateTask(Task oldTask, Task newTask) async {
    await _taskService.updateTask(newTask);
    loadTasks();
  }

  int getIndex(Task task) {
    return allTasks.indexOf(task);
  }

  bool isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
