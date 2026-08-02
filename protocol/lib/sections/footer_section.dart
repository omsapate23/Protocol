import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      width: double.infinity,
      color: AppColors.background,
      child: const Column(
        children: [
          Text(
            'PROTOCOL Cyber Security Club © 2026 | AISSMS COE',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textMuted,
              fontFamily: 'monospace',
              fontSize: 12,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Instagram: @protocol_cyberclub  |  Location: AISSMS COE, Pune',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
