import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onExplorePressed;

  const HeroSection({super.key, required this.onExplorePressed});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _breatheController;
  late Animation<double> _breatheAnimation;

  @override
  void initState() {
    super.initState();
    _breatheController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _breatheAnimation = CurvedAnimation(
      parent: _breatheController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _breatheController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final baseLogoWidth = size.width < 600 ? 320.0 : 540.0;

    return AnimatedBuilder(
      animation: _breatheAnimation,
      builder: (context, child) {
        final breatheValue = _breatheAnimation.value;
        final gradientAlpha = 0.14 + (breatheValue * 0.14);
        final logoOpacity = 0.16 + (breatheValue * 0.12);
        final logoScale = 0.96 + (breatheValue * 0.10);

        return Container(
          constraints: BoxConstraints(minHeight: size.height),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center,
              radius: 0.95,
              colors: [
                AppColors.primaryRed.withValues(alpha: gradientAlpha),
                AppColors.background,
              ],
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Standalone Headline Text Banner ABOVE terminal box
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [
                        Colors.white,
                        AppColors.primaryRed,
                        AppColors.cyanAccent,
                      ],
                    ).createShader(bounds),
                    child: Text(
                      'DECODE. DEFEND. DOMINATE.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width < 600 ? 28 : 46,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                        height: 1.1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Fixed Terminal Window Container (Balanced 1150px)
                  Container(
                    constraints: const BoxConstraints(
                      maxWidth: 1150,
                      minHeight: 420,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF0A0A12).withValues(alpha: 0.20),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: AppColors.cyanAccent.withValues(alpha: 0.25),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.cyanAccent.withValues(alpha: 0.08),
                                blurRadius: 30,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Sleek Minimal Top Border Bar
                              Container(
                                height: 10,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.black.withValues(alpha: 0.4),
                                  border: Border(
                                    bottom: BorderSide(
                                      color: AppColors.cyanAccent.withValues(alpha: 0.15),
                                    ),
                                  ),
                                ),
                              ),
                              // Terminal Inner Content Frame
                              Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  // Breathing Background Watermark Logo (Independent element)
                                  Positioned.fill(
                                    child: Center(
                                      child: Opacity(
                                        opacity: logoOpacity,
                                        child: Transform.scale(
                                          scale: logoScale,
                                          child: Image.asset(
                                            'assets/logo.png',
                                            width: baseLogoWidth,
                                            fit: BoxFit.contain,
                                            errorBuilder: (_, __, ___) => const SizedBox(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Flushed Top-Left Shell Prompt
                                  Container(
                                    width: double.infinity,
                                    constraints: const BoxConstraints(minHeight: 410),
                                    padding: const EdgeInsets.all(24),
                                    alignment: Alignment.topLeft,
                                    child: CyberGlitchPrompt(
                                      fontSize: size.width < 600 ? 16 : 22,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Explore Button OUTSIDE terminal window
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: widget.onExplorePressed,
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CyberGlitchPrompt extends StatefulWidget {
  final double fontSize;

  const CyberGlitchPrompt({super.key, this.fontSize = 22});

  @override
  State<CyberGlitchPrompt> createState() => _CyberGlitchPromptState();
}

class _CyberGlitchPromptState extends State<CyberGlitchPrompt> {
  Timer? _glitchLoopTimer;
  Timer? _glitchResetTimer;
  Timer? _cursorTimer;

  bool _isGlitched = false;
  bool _showCursor = true;

  @override
  void initState() {
    super.initState();
    // Periodically glitch every 2 seconds for 150ms
    _glitchLoopTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (mounted) {
        setState(() => _isGlitched = true);
        _glitchResetTimer?.cancel();
        _glitchResetTimer = Timer(const Duration(milliseconds: 150), () {
          if (mounted) {
            setState(() => _isGlitched = false);
          }
        });
      }
    });

    // Blinking terminal cursor
    _cursorTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (mounted) {
        setState(() => _showCursor = !_showCursor);
      }
    });
  }

  @override
  void dispose() {
    _glitchLoopTimer?.cancel();
    _glitchResetTimer?.cancel();
    _cursorTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          'root@protocol:~# ',
          style: TextStyle(
            color: AppColors.primaryRed,
            fontFamily: 'monospace',
            fontSize: widget.fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'PROTOCOL IS LIVE',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'monospace',
            fontSize: widget.fontSize,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.5,
            shadows: _isGlitched
                ? const [
                    Shadow(
                      color: AppColors.primaryRed,
                      offset: Offset(-2.0, 0.0),
                    ),
                    Shadow(
                      color: AppColors.cyanAccent,
                      offset: Offset(2.0, 0.0),
                    ),
                  ]
                : null,
          ),
        ),
        Text(
          _showCursor ? '_' : ' ',
          style: TextStyle(
            color: const Color(0xFF27C93F),
            fontFamily: 'monospace',
            fontSize: widget.fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
