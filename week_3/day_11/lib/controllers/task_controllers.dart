

import 'package:day_11/models/task_model.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  var allTasks = <Task>[].obs;
  var todayTasks = <Task>[].obs;
  var upcomingTasks = <Task>[].obs;
  var completedTasks = <Task>[].obs;

  @override
  void onInit() {
    super.onInit();

    // Dummy data for now
    allTasks.addAll([
      Task(title: "Grocery Shopping", dueDate: DateTime(2025, 8, 18 ),description: 'task'),
      Task(title: "Meeting with Alex", dueDate: DateTime(2025, 8, 18),description: 'task'),
      Task(title: "Project Presentation", dueDate: DateTime(2025, 8, 18),description: 'task'),
      Task(title: "Book Appointment", dueDate: DateTime(2025, 8, 20),description: 'task'),
      Task(title: "Plan Vacation", dueDate: DateTime(2025, 8, 25),description: 'task'),
      Task(title: "Morning Workout", dueDate: DateTime(2025, 8, 17), isCompleted: true,description: 'task'),
      Task(title: "Pay Bills", dueDate: DateTime(2025, 8, 16), isCompleted: true,description: 'task'),
    ]);

    categorizeTasks();
  }

  void categorizeTasks() {
    final today = DateTime.now();

    todayTasks.assignAll(
      allTasks.where((task) =>
        !task.isCompleted.value && isSameDate(task.dueDate, today),
      ),
    );

    upcomingTasks.assignAll(
      allTasks.where((task) =>
        !task.isCompleted.value && task.dueDate.isAfter(today),
      ),
    );

    completedTasks.assignAll(
      allTasks.where((task) => task.isCompleted.value),
    );
  }

  void toggleTask(Task task) {
    task.isCompleted.value = !task.isCompleted.value;
    categorizeTasks();
  }

  void addTask(Task task) {
    allTasks.add(task);
    categorizeTasks();
  }

  void deleteTask(Task task) {
    allTasks.remove(task);
    categorizeTasks();
  }

  void updateTask(Task oldTask, Task newTask) {
  int index = allTasks.indexOf(oldTask);
  if (index != -1) {
    allTasks[index] = newTask;
    allTasks.refresh();
    categorizeTasks();
  }
}
 
 int getIndex(Task task) {
    return allTasks.indexOf(task);
  }


  bool isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
