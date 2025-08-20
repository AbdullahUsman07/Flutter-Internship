

import 'package:day_11/controllers/task_controllers.dart';
import 'package:day_11/screens/task_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/task_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback? onChanged;
  final bool isOverdue;

   const TaskTile({super.key, required this.task, this.onChanged, this.isOverdue = false});

  @override
  Widget build(BuildContext context) {
    int index = Get.find<TaskController>().getIndex(task);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Obx(() => Checkbox(
                    value: task.isCompleted.value,
                    onChanged: (_) => onChanged?.call(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    activeColor: AppColors.primary,
                  )),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TaskDetailScreen(index: index)));
                        },
                        child: Text(
                          task.title,
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.textDark,
                            decoration: task.isCompleted.value
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                      )),
                      Text(
                        '${task.dueDate.day.toString().padLeft(2, '0')}/${task.dueDate.month.toString().padLeft(2, '0')}',
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.textLight,
                        ),
                      ),
                ],
              ),
            ],
          ),
          Obx(() => Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: _getStatusColor(),
                  shape: BoxShape.circle,
                ),
              )),
        ],
      ),
    );
  }

  Color _getStatusColor(){
    if(task.isCompleted.value) {
      return Colors.grey;
    } else if (isOverdue == true) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }
}
