import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CollaborationsSection extends StatelessWidget {
  const CollaborationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final partners = ['MCCIA', 'miniOrange', 'ISTE', 'IETE', 'IEI'];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      constraints: const BoxConstraints(maxWidth: 1100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'INDUSTRY CONNECTIONS & PARTNERSHIPS',
            style: TextStyle(
              fontFamily: 'monospace',
              color: AppColors.cyanAccent,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              letterSpacing: 1.5,
            ),
          ),
          const Divider(color: AppColors.borderSubtle, height: 32),
          const SizedBox(height: 12),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: partners
                .map((partner) => _PartnerCard(partnerName: partner))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _PartnerCard extends StatelessWidget {
  final String partnerName;

  const _PartnerCard({required this.partnerName});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.surface.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.borderSubtle),
          ),
          child: Text(
            partnerName,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontFamily: 'monospace',
              fontWeight: FontWeight.bold,
              fontSize: 14,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
