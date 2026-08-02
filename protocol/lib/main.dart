import 'package:flutter/material.dart';
import 'constants/app_colors.dart';
import 'widgets/nav_bar.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/vision_section.dart';
import 'sections/domains_section.dart';
import 'sections/events_section.dart';
import 'sections/leadership_section.dart';
import 'sections/footer_section.dart';

void main() {
  runApp(const ProtocolApp());
}

class ProtocolApp extends StatelessWidget {
  const ProtocolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PROTOCOL — Cyber Security Club | AISSMS COE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.primaryRed,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _visionKey = GlobalKey();
  final GlobalKey _domainsKey = GlobalKey();
  final GlobalKey _eventsKey = GlobalKey();
  final GlobalKey _leadershipKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      appBar: NavBar(
        onAboutTap: () => _scrollTo(_aboutKey),
        onVisionTap: () => _scrollTo(_visionKey),
        onDomainsTap: () => _scrollTo(_domainsKey),
        onEventsTap: () => _scrollTo(_eventsKey),
        onLeadershipTap: () => _scrollTo(_leadershipKey),
      ),
      drawer: isDesktop
          ? null
          : NavDrawer(
              onAboutTap: () => _scrollTo(_aboutKey),
              onVisionTap: () => _scrollTo(_visionKey),
              onDomainsTap: () => _scrollTo(_domainsKey),
              onEventsTap: () => _scrollTo(_eventsKey),
              onLeadershipTap: () => _scrollTo(_leadershipKey),
            ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(onExplorePressed: () => _scrollTo(_aboutKey)),
            Container(key: _aboutKey, child: const AboutSection()),
            Container(key: _visionKey, child: const VisionSection()),
            Container(key: _domainsKey, child: const DomainsSection()),
            Container(key: _eventsKey, child: const EventsSection()),
            Container(key: _leadershipKey, child: const LeadershipSection()),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}