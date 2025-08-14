import 'package:flutter/material.dart';

class CalorieInfo extends StatelessWidget {
  final String title;
  final String description;
  final String totalCalories;

  const CalorieInfo({
    super.key,
    this.title = "Calorie Info",
    this.description = "Zinger burger + 345ml soft drink",
    this.totalCalories = "500 kcal",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(255, 79, 0, 1),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSection(title, isFirst: true),
          _buildDivider(),
          _buildSection(description),
          _buildDivider(),
          _buildSection(totalCalories, isLast: true),
        ],
      ),
    );
  }

  Widget _buildSection(String text, {bool isFirst = false, bool isLast = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: isFirst ? FontWeight.bold : FontWeight.normal,
          fontSize: isFirst ? 14 : 12,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 0,
      color: const Color.fromRGBO(255, 79, 0, 1),
      thickness: 1,
    );
  }
}
