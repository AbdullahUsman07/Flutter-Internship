import 'package:day_1/provider/meal_cateogory_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';

class MealCategoryRow extends StatelessWidget {
  const MealCategoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['Breakfast', 'Lunch', 'Dinner'];
    final provider = Provider.of<MealCategoryProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Meal Category',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...List.generate(categories.length, (index) {
              final isSelected = provider.selectedIndex == index;

              return GestureDetector(
                onTap: () => provider.selectCategory(index),
                child: Container(
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.accent : AppColors.card,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : AppColors.greyText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }),

            Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}