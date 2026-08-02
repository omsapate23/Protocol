import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class SectionWrapper extends StatelessWidget {
  final String title;
  final Widget child;

  const SectionWrapper({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 24),
      constraints: const BoxConstraints(maxWidth: 1100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 4, height: 24, color: AppColors.primaryRed),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'monospace',
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          const Divider(color: AppColors.borderSubtle, height: 36),
          child,
        ],
      ),
    );
  }
}
