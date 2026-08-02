import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';
import '../widgets/section_wrapper.dart';

class EventsSection extends StatelessWidget {
  const EventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final partners = ['MCCIA', 'miniOrange', 'ISTE', 'IETE', 'IEI'];

    return SectionWrapper(
      title: '04. MAJOR INITIATIVES & KEY EVENTS',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _EventCard(
            title: 'National Level CTF Qualification (HackData 2026)',
            desc:
                'Successfully qualified for the National-Level Offline Final Round of HackData 2026 CTF at Shiv Nadar University, Delhi NCR. '
                'The team demonstrated proficiency in Web Exploitation, Cryptography, Reverse Engineering, and Digital Forensics.',
          ),
          const SizedBox(height: 16),
          const _EventCard(
            title: 'Cyber Hunt 2025',
            desc:
                'Institute flagship cybersecurity puzzle competition engaging 47 teams (141 total participants) across cryptography, web security, and logic challenges.',
          ),
          const SizedBox(height: 16),
          const _EventCard(
            title: 'Cybersecurity 101 Bootcamp',
            desc:
                'Comprehensive 4-day training camp covering Linux basics, networking, penetration testing, and incident response for 50+ students.',
          ),
          const SizedBox(height: 16),
          const _EventCard(
            title: 'Industry Expert Talks & Summit Representation',
            desc:
                'Hosted sessions with cybersecurity veterans and officially represented AISSMS COE at the IdentityShield Cyber Security Summit 2026.',
          ),
          const SizedBox(height: 36),
          const Text(
            '// INDUSTRY CONNECTIONS & PARTNERSHIPS',
            style: TextStyle(
              fontFamily: 'monospace',
              color: AppColors.cyanAccent,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: partners
                .map(
                  (partner) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: AppColors.primaryRed.withValues(alpha: 0.5),
                      ),
                    ),
                    child: Text(
                      partner,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'monospace',
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _EventCard extends StatelessWidget {
  final String title;
  final String desc;

  const _EventCard({required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 3,
                height: 16,
                color: AppColors.primaryRed,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            desc,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
