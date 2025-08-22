import 'dart:async';

import 'package:day_11/models/task_model.dart';
import 'package:day_11/services/analytics_service.dart';
import 'package:day_11/services/notification_service.dart';
import 'package:day_11/services/task_service.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  var allTasks = <Task>[].obs;
  var todayTasks = <Task>[].obs;
  var upcomingTasks = <Task>[].obs;
  var completedTasks = <Task>[].obs;
  var overdueTasks = <Task>[].obs;

  final TaskService _taskService = TaskService();
  final NotificationService _notificationService = NotificationService();
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
    final nowCompleted = !task.isCompleted.value;
    task.isCompleted.value = nowCompleted;
    await _taskService.updateTask(task);

    // updating the analytics
    if (nowCompleted) {
      await AnalyticsService.taskCompleted(
        taskId: task.id!,
        completedAt: DateTime.now(),
      );
    } else {
      await AnalyticsService.taskUpdated(
        taskId: task.id!,
        changedTitle: false,
        changedDueDate: false,
        changedPriority: false,
      );
    }

    if (nowCompleted) {
      await _notificationService.cancelTaskSchedules(task.id!);
    } else {
      // Re-schedule notifications if re-activated
      await _notificationService.scheduleDueToday(
        taskId: task.id!,
        taskTitle: task.title,
        dueDate: task.dueDate,
      );
      await _notificationService.scheduleOverdue(
        taskId: task.id!,
        taskTitle: task.title,
        dueDate: task.dueDate,
      );
    }

    categorizeTasks();
  }

  Future<void> addTask(Task task) async {
    final id = await _taskService.addTask(task);
    task.id = id;

    // adding the task in the analytics
    await AnalyticsService.taskCreated(
      taskId: id,
      priority: task.priority,
      dueDate: task.dueDate,
    );

    // show the immediate notification after adding the task
    await _notificationService.showTaskAdded(task.title);

    // Schedule due + overdue notifications
    await _notificationService.scheduleDueToday(
      taskId: task.id!,
      taskTitle: task.title,
      dueDate: task.dueDate,
    );
    await _notificationService.scheduleOverdue(
      taskId: task.id!,
      taskTitle: task.title,
      dueDate: task.dueDate,
    );

    loadTasks();
  }

  Future<void> deleteTask(Task task) async {
    await _taskService.deleteTask(task.id!);
    allTasks.remove(task);

    // analytics
    await AnalyticsService.taskDeleted(taskId: task.id!);

    // Cancel any scheduled notifications for this task
    await _notificationService.cancelTaskSchedules(task.id!);

    // Show immediate notification
    await _notificationService.showTaskDeleted(task.title);

    categorizeTasks();
  }

  Future<void> updateTask(Task oldTask, Task newTask) async {
    await _taskService.updateTask(newTask);

    // analytics
    final changedTitle = oldTask.title != newTask.title;
    final changedDueDate = oldTask.dueDate != newTask.dueDate;
    final changedPriority = oldTask.priority != newTask.priority;

    await AnalyticsService.taskUpdated(
      taskId: newTask.id!,
      changedTitle: changedTitle,
      changedDueDate: changedDueDate,
      changedPriority: changedPriority,
    );

    // Cancel old notifications
    await _notificationService.cancelTaskSchedules(oldTask.id!);

    // Re-schedule for updated task
    await _notificationService.scheduleDueToday(
      taskId: newTask.id!,
      taskTitle: newTask.title,
      dueDate: newTask.dueDate,
    );
    await _notificationService.scheduleOverdue(
      taskId: newTask.id!,
      taskTitle: newTask.title,
      dueDate: newTask.dueDate,
    );

    loadTasks();
  }

  int getIndex(Task task) {
    return allTasks.indexOf(task);
  }

  bool isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
