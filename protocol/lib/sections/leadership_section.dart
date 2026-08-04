import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';
import '../widgets/section_wrapper.dart';

class LeadershipSection extends StatelessWidget {
  const LeadershipSection({super.key});

  @override
  Widget build(BuildContext context) {
    final executiveBoard = [
      {'role': 'President', 'name': 'Sarvesh Deshmukh'},
      {'role': 'Vice-President', 'name': 'Atharva Urde'},
      {'role': 'Technical Lead', 'name': 'Sushant Koul'},
      {'role': 'Research Lead', 'name': 'Varad Hajare'},
      {'role': 'Design Lead', 'name': 'Rudra Chandgude'},
      {'role': 'Event Management Lead', 'name': 'Aakash Haygonde'},
    ];

    return SectionWrapper(
      title: '05. CLUB LEADERSHIP',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'FACULTY COORDINATORS',
                  style: TextStyle(
                    color: AppColors.primaryRed,
                    fontFamily: 'monospace',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 12),
                Wrap(
                  spacing: 24,
                  runSpacing: 12,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.person_outline,
                            color: AppColors.cyanAccent, size: 18),
                        SizedBox(width: 8),
                        Text(
                          'Mrs. Ankita Gupta',
                          style: TextStyle(
                              color: AppColors.textPrimary, fontSize: 14),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.person_outline,
                            color: AppColors.cyanAccent, size: 18),
                        SizedBox(width: 8),
                        Text(
                          'Mrs. Bhakti Patil',
                          style: TextStyle(
                              color: AppColors.textPrimary, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'EXECUTIVE BOARD',
                  style: TextStyle(
                    color: AppColors.primaryRed,
                    fontFamily: 'monospace',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: executiveBoard.map((member) {
                    return SizedBox(
                      width: 220,
                      child: Row(
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: AppColors.cyanAccent,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  member['role']!,
                                  style: const TextStyle(
                                    color: AppColors.textMuted,
                                    fontSize: 11,
                                    fontFamily: 'monospace',
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  member['name']!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
