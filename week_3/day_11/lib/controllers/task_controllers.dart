
// import 'package:day_11/models/task_model.dart';
// import 'package:get/get.dart';


// class TaskController extends GetxController {
//   var todayTasks = <Task>[].obs;
//   var upcomingTasks = <Task>[].obs;
//   var completedTasks = <Task>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     // Dummy data for now
//     todayTasks.addAll([
//       Task(title: "Grocery Shopping", dueDate: "Due 10/10"),
//       Task(title: "Meeting with Alex", dueDate: "Due 10/10"),
//       Task(title: "Project Presentation", dueDate: "Due 10/10"),
//     ]);

//     upcomingTasks.addAll([
//       Task(title: "Book Appointment", dueDate: "Due 10/12"),
//       Task(title: "Plan Vacation", dueDate: "Due 10/15"),
//     ]);

//     completedTasks.addAll([
//       Task(title: "Morning Workout", dueDate: "Completed 10/09", isCompleted: true),
//       Task(title: "Pay Bills", dueDate: "Completed 10/08", isCompleted: true),
//     ]);
//   }

//   void toggleTask(Task task) {
//     if (task.isCompleted.value) {
//       completedTasks.remove(task);
//       todayTasks.add(task..isCompleted.value = false);
//     } else {
//       todayTasks.remove(task);
//       completedTasks.add(Task(
//         title: task.title,
//         dueDate: task.dueDate,
//         isCompleted: true,
//       ));
//     }
//   }

//   bool isToday(String dueDate){
//     final today = DateTime.now();
//     final taskDate = DateTime.parse(dueDate);
//     return today.year == taskDate.year &&
//            today.month == taskDate.month &&
//            today.day == taskDate.day;
//   }
// }


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

  bool isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
