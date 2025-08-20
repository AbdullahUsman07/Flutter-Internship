
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/task_model.dart';
import 'task_tile.dart';
import '../utils/app_text_styles.dart';
import '../utils/app_colors.dart';

class TaskSection extends StatelessWidget {
  final String title;
  final RxList<Task> tasks;
  final Function(Task)? onToggle;
  final bool isOverdue;

  const TaskSection({
    Key? key,
    required this.title,
    required this.tasks,
    this.isOverdue = false,
    this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => tasks.isEmpty
        ? const SizedBox.shrink()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Text(
                  title,
                  style: AppTextStyles.heading.copyWith(
                    color: AppColors.textDark,
                  ),
                ),
              ),
              ...tasks.map(
                (task) => TaskTile(
                  task: task,
                  onChanged: () => onToggle?.call(task),
                  isOverdue: isOverdue,
                ),
              ).toList(),
            ],
          ));
  }
}
