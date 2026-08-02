import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onAboutTap;
  final VoidCallback onVisionTap;
  final VoidCallback onDomainsTap;
  final VoidCallback onEventsTap;
  final VoidCallback onLeadershipTap;

  const NavBar({
    super.key,
    required this.onAboutTap,
    required this.onVisionTap,
    required this.onDomainsTap,
    required this.onEventsTap,
    required this.onLeadershipTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return AppBar(
      backgroundColor: AppColors.background.withValues(alpha: 0.9),
      elevation: 0,
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryRed),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'PROTOCOL',
              style: TextStyle(
                color: AppColors.primaryRed,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                fontFamily: 'monospace',
              ),
            ),
          ),
          const SizedBox(width: 10),
          if (isDesktop)
            const Text(
              '// AISSMS COE',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textMuted,
                fontFamily: 'monospace',
              ),
            ),
        ],
      ),
      actions: isDesktop
          ? [
              _navButton('About', onAboutTap),
              _navButton('Vision', onVisionTap),
              _navButton('Domains', onDomainsTap),
              _navButton('Events', onEventsTap),
              _navButton('Leadership', onLeadershipTap),
              const SizedBox(width: 20),
            ]
          : null,
    );
  }

  Widget _navButton(String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontFamily: 'monospace',
        ),
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
  final VoidCallback onAboutTap;
  final VoidCallback onVisionTap;
  final VoidCallback onDomainsTap;
  final VoidCallback onEventsTap;
  final VoidCallback onLeadershipTap;

  const NavDrawer({
    super.key,
    required this.onAboutTap,
    required this.onVisionTap,
    required this.onDomainsTap,
    required this.onEventsTap,
    required this.onLeadershipTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        children: [
          _drawerItem(context, 'About', onAboutTap),
          _drawerItem(context, 'Vision & Mission', onVisionTap),
          _drawerItem(context, 'Core Domains', onDomainsTap),
          _drawerItem(context, 'Key Events', onEventsTap),
          _drawerItem(context, 'Leadership', onLeadershipTap),
        ],
      ),
    );
  }

  Widget _drawerItem(BuildContext context, String text, VoidCallback onPressed) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontFamily: 'monospace',
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        onPressed();
      },
    );
  }
}
