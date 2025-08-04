import 'package:flutter/material.dart';

class SeeMoreButton extends StatelessWidget {
  final VoidCallback? onTap;

  const SeeMoreButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          margin: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(800), 
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            "See More",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
