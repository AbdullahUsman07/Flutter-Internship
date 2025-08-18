
import 'package:day_11/controllers/task_controllers.dart';
import 'package:day_11/screens/add_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/task_section.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class TasksScreen extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());

  TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Center(
                child: Text(
                  "Tasks",
                  style: AppTextStyles.heading.copyWith(
                    fontSize: 22,
                  ),
                ),
              ),
            ),

            Expanded(
              child:ListView(
                  children: [
                    TaskSection(
                      title: "Today's Tasks",
                      tasks: taskController.todayTasks,
                      onToggle: taskController.toggleTask,
                    ),
                    TaskSection(
                      title: "Upcoming Tasks",
                      tasks: taskController.upcomingTasks,
                      onToggle: taskController.toggleTask,
                    ),
                    TaskSection(
                      title: "Completed Tasks",
                      tasks: taskController.completedTasks,
                      onToggle: taskController.toggleTask,
                    ),
                  ],
                ),
              ),

            // Floating add button
            Padding(
              padding: const EdgeInsets.only(right: 16, bottom: 16),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddTaskScreen()));
                  },
                  backgroundColor: AppColors.primary,
                  child: const Icon(Icons.add, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
