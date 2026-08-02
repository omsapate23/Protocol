import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';
import '../widgets/section_wrapper.dart';

class DomainsSection extends StatelessWidget {
  const DomainsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final domains = [
      {
        'title': '1. Technical Team',
        'desc': 'Drives CTF challenges, hands-on labs, vulnerability setup, and penetration testing methodologies.'
      },
      {
        'title': '2. Research Team',
        'desc': 'Explores AI-driven threat analysis, digital forensics, cyber laws, and technical documentation.'
      },
      {
        'title': '3. Event Management Team',
        'desc': 'Manages logistics, venue setup, and execution of workshops and competitions.'
      },
      {
        'title': '4. Design Team',
        'desc': 'Maintains visual branding through UI/UX assets, posters, and promotional graphics.'
      },
      {
        'title': '5. Media & Marketing Team',
        'desc': 'Drives external reach, PR, sponsorship liaisons, social strategy, photo/video coverage, teasers, and tutorials.'
      },
      {
        'title': '6. Documentation Team',
        'desc': 'Prepares official event reports, technical write-ups, and archives club records.'
      },
      {
        'title': '7. Treasury Team',
        'desc': 'Oversees budgeting, financial auditing, and transparent funding for club events.'
      },
    ];

    return SectionWrapper(
      title: '03. CORE DOMAINS',
      child: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = constraints.maxWidth > 900
              ? 3
              : (constraints.maxWidth > 600 ? 2 : 1);
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: domains.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: constraints.maxWidth < 600 ? 1.8 : 1.4,
            ),
            itemBuilder: (context, index) {
              final domain = domains[index];
              return GlassCard(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      domain['title']!,
                      style: const TextStyle(
                        color: AppColors.cyanAccent,
                        fontFamily: 'monospace',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Text(
                        domain['desc']!,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 13,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
