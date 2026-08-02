import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onExplorePressed;

  const HeroSection({super.key, required this.onExplorePressed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      constraints: BoxConstraints(minHeight: size.height),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 0.9,
          colors: [
            AppColors.primaryRed.withValues(alpha: 0.12),
            AppColors.background,
          ],
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Translucent Watermark
          Opacity(
            opacity: 0.08,
            child: Image.asset(
              'assets/logo.png',
              width: size.width < 600 ? 280 : 450,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => const SizedBox(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Glowing Central Logo Badge
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryRed.withValues(alpha: 0.35),
                        blurRadius: 40,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/logo.png',
                    height: 120,
                    errorBuilder: (_, __, ___) => const Icon(
                      Icons.shield_outlined,
                      color: AppColors.primaryRed,
                      size: 80,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // System Status Badge
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.cyanAccent.withValues(alpha: 0.06),
                        border: Border.all(
                          color: AppColors.cyanAccent.withValues(alpha: 0.3),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 3,
                            backgroundColor: AppColors.cyanAccent,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'SYS_STATUS // ONLINE',
                            style: TextStyle(
                              color: AppColors.cyanAccent,
                              fontFamily: 'monospace',
                              fontSize: 11,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      Colors.white,
                      AppColors.primaryRed,
                      AppColors.cyanAccent,
                    ],
                  ).createShader(bounds),
                  child: const Text(
                    'DECODE. DEFEND. DOMINATE.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                      height: 1.1,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Understand. Secure. Master.',
                  style: TextStyle(
                    color: AppColors.cyanAccent,
                    fontSize: 17,
                    fontFamily: 'monospace',
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'AISSMS College of Engineering, Pune',
                  style: TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 14,
                    fontFamily: 'monospace',
                  ),
                ),
                const SizedBox(height: 40),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: onExplorePressed,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 36,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryRed.withValues(alpha: 0.15),
                            border: Border.all(
                              color: AppColors.primaryRed,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primaryRed.withValues(alpha: 0.3),
                                blurRadius: 20,
                                spreadRadius: -2,
                              ),
                            ],
                          ),
                          child: const Text(
                            '> INITIALIZE EXPLORATION',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'monospace',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
