import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';
import '../widgets/section_wrapper.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionWrapper(
      title: '01. ABOUT PROTOCOL',
      child: GlassCard(
        child: Text(
          'Protocol is the official student-run, institute-level cybersecurity club at AISSMS College of Engineering, Pune. '
          'Established to promote digital safety awareness, technical excellence, and cybersecurity innovation, Protocol serves as a platform where curiosity meets real-world execution.\n\n'
          'In an era driven by rapid digitization, cloud infrastructure, and interconnected networks, cybersecurity is no longer just a specialization—it is a fundamental necessity. '
          'Open to students across all engineering disciplines, Protocol bridges the gap between theoretical classroom learning and practical cyber defense techniques through hands-on workshops, '
          'Capture The Flag (CTF) competitions, live attack/defense simulations, and research initiatives.\n\n'
          'Guided by our core philosophy, we empower members to Decode complex vulnerabilities, Defend critical systems, and Dominate the digital cybersecurity landscape.',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 15,
            height: 1.6,
          ),
        ),
      ),
    );
  }
}
