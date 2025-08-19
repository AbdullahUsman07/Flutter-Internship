

import 'package:day_11/utils/app_colors.dart';
import 'package:day_11/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextLoginFeild extends StatelessWidget {
  const CustomTextLoginFeild({
    super.key,
    required this.heading,
    required this.hintText,
    this.obscureText = false,
  });

  final String heading;
  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: AppTextStyles.body.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Color(0xFF637C88)),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 18,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFDCE2E5)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFDCE2E5)),
              ),
            ),
            style: AppTextStyles.body.copyWith(
              color: AppColors.textDark,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
