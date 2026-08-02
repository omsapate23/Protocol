import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';
import '../widgets/section_wrapper.dart';

class VisionSection extends StatelessWidget {
  const VisionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionWrapper(
      title: '02. VISION & MISSION',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'VISION',
                  style: TextStyle(
                    color: AppColors.cyanAccent,
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'To build a resilient community of ethical, innovative, and security-conscious technology leaders by fostering excellence in cybersecurity education, emerging technologies, technical research, and collaborative learning.',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MISSION DIRECTIVES',
                  style: TextStyle(
                    color: AppColors.cyanAccent,
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 14),
                _MissionItem(text: 'Cyber Awareness: Promote digital security best practices across the student community.'),
                _MissionItem(text: 'Practical Training: Provide hands-on learning through bootcamps, CTFs, and hackathons.'),
                _MissionItem(text: 'Innovation & Research: Encourage student research in ethical hacking, AI security, and forensics.'),
                _MissionItem(text: 'Industry Integration: Connect students with industry veterans, researchers, and alumni.'),
                _MissionItem(text: 'Ethics & Integrity: Instill a culture of ethical hacking and responsible disclosure.'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MissionItem extends StatelessWidget {
  final String text;
  const _MissionItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(
              color: AppColors.primaryRed,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
