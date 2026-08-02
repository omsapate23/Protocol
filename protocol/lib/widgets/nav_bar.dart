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
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.borderSubtle),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 50,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.shield_outlined,
                    color: AppColors.primaryRed,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'PROTOCOL',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '// AISSMS COE',
                  style: TextStyle(
                    color: AppColors.textMuted,
                    fontFamily: 'monospace',
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
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
