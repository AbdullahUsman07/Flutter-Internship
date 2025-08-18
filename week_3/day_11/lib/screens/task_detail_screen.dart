
import 'package:day_11/controllers/task_controllers.dart';
import 'package:day_11/models/task_model.dart';
import 'package:day_11/utils/app_colors.dart';
import 'package:day_11/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TaskDetailScreen extends StatelessWidget {
  final Task task;

  const TaskDetailScreen({super.key, required this.task});

  void delTask(){
    final TaskController taskController = Get.find();
    taskController.deleteTask(task);
    Get.defaultDialog(
      title: "",
      middleText: "Task Deleted Successfully",
      textConfirm: "OK",
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back(); // close dialog
        Get.back(); // navigate back after deletion
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Get.back(),
                  ),
                  Expanded(
                    child: Text(
                      "Task Details",
                      style: AppTextStyles.subHeading,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 48), // keep title centered
                ],
              ),
            ),

            // Task Info
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            
                    const SizedBox(height: 16,),

                    // Title
                    Text(task.title,
                        style: AppTextStyles.heading.copyWith(fontSize: 22)),
                    const SizedBox(height: 12),

                    // Description
                      Text(task.description,
                          style: AppTextStyles.body),

                    const SizedBox(height: 26),

                    // Due Date
                    Text("Due Date", style: AppTextStyles.subHeading),
                    const SizedBox(height: 5,),
                    Text(
                      "${task.dueDate.day}/${task.dueDate.month}/${task.dueDate.year}",
                      style: AppTextStyles.body,
                    ),

                    const SizedBox(height: 26),

                    // Priority
                    Text("Priority", style: AppTextStyles.subHeading),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.flag, color: Colors.black),
                        ),
                        const SizedBox(width: 12),
                        Text("Normal",
                            style: AppTextStyles.body),
                      ],
                    ),

                    const SizedBox(height: 26),

                    // Category
                    Text("Category", style: AppTextStyles.subHeading),
                    const SizedBox(height: 5,),
                    Text("Uncategorized",
                        style: AppTextStyles.body),
                  ],
                ),
              ),
            ),

            // Buttons
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Navigate to edit task screen
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.surface,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("Edit"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        delTask();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("Delete"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
