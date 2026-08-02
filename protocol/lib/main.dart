import 'package:flutter/material.dart';

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
        scaffoldBackgroundColor: const Color(0xFF0A0A0E),
        primaryColor: const Color(0xFFFF2E4C),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFF2E4C),
          surface: Color(0xFF12121A),
          secondary: Color(0xFF00E5FF),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFFC0C0C0), fontFamily: 'monospace'),
          bodyMedium: TextStyle(color: Color(0xFFA0A0B0)),
        ),
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
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _visionKey = GlobalKey();
  final GlobalKey _domainsKey = GlobalKey();
  final GlobalKey _eventsKey = GlobalKey();
  final GlobalKey _leadershipKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0A0E).withOpacity(0.95),
        elevation: 0,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFFF2E4C)),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'PROTOCOL',
                style: TextStyle(
                  color: Color(0xFFFF2E4C),
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
                style: TextStyle(fontSize: 12, color: Colors.grey, fontFamily: 'monospace'),
              ),
          ],
        ),
        actions: isDesktop
            ? [
                _navButton('About', () => _scrollTo(_aboutKey)),
                _navButton('Vision', () => _scrollTo(_visionKey)),
                _navButton('Domains', () => _scrollTo(_domainsKey)),
                _navButton('Events', () => _scrollTo(_eventsKey)),
                _navButton('Leadership', () => _scrollTo(_leadershipKey)),
                const SizedBox(width: 20),
              ]
            : null,
      ),
      drawer: isDesktop
          ? null
          : Drawer(
              backgroundColor: const Color(0xFF12121A),
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                children: [
                  _drawerItem('About', () => _scrollTo(_aboutKey)),
                  _drawerItem('Vision & Mission', () => _scrollTo(_visionKey)),
                  _drawerItem('Core Domains', () => _scrollTo(_domainsKey)),
                  _drawerItem('Key Events', () => _scrollTo(_eventsKey)),
                  _drawerItem('Leadership', () => _scrollTo(_leadershipKey)),
                ],
              ),
            ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildHeroSection(context),
            _buildSectionKey(_aboutKey, _buildAboutSection(context)),
            _buildSectionKey(_visionKey, _buildVisionMissionSection(context)),
            _buildSectionKey(_domainsKey, _buildDomainsSection(context)),
            _buildSectionKey(_eventsKey, _buildEventsSection(context)),
            _buildCollaborationsSection(context),
            _buildSectionKey(_leadershipKey, _buildLeadershipSection(context)),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _navButton(String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white70, fontFamily: 'monospace'),
      ),
    );
  }

  Widget _drawerItem(String text, VoidCallback onPressed) {
    return ListTile(
      title: Text(text, style: const TextStyle(color: Colors.white, fontFamily: 'monospace')),
      onTap: () {
        Navigator.pop(context);
        onPressed();
      },
    );
  }

  Widget _buildSectionKey(GlobalKey key, Widget child) {
    return Container(key: key, child: child);
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0A0A0E), Color(0xFF180B14), Color(0xFF0A0A0E)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          const Text(
            '> PROTOCOL // CYBER SECURITY CLUB',
            style: TextStyle(
              color: Color(0xFFFF2E4C),
              fontFamily: 'monospace',
              fontSize: 14,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'DECODE. DEFEND. DOMINATE.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Understand. Secure. Master.',
            style: TextStyle(color: Color(0xFF00E5FF), fontSize: 18, fontFamily: 'monospace'),
          ),
          const SizedBox(height: 24),
          const Text(
            'AISSMS College of Engineering, Pune',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF2E4C),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            onPressed: () => _scrollTo(_aboutKey),
            child: const Text(
              'EXPLORE',
              style: TextStyle(color: Colors.white, fontFamily: 'monospace', fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return _buildSectionContainer(
      title: '01. ABOUT PROTOCOL',
      child: const Text(
        'Protocol is the official student-run, institute-level cybersecurity club at AISSMS College of Engineering, Pune. '
        'Established to promote digital safety awareness, technical excellence, and cybersecurity innovation, Protocol serves as a platform where curiosity meets real-world execution.\n\n'
        'In an era driven by rapid digitization, cloud infrastructure, and interconnected networks, cybersecurity is no longer just a specialization—it is a fundamental necessity. '
        'Open to students across all engineering disciplines, Protocol bridges the gap between theoretical classroom learning and practical cyber defense techniques through hands-on workshops, '
        'Capture The Flag (CTF) competitions, live attack/defense simulations, and research initiatives.\n\n'
        'Guided by our core philosophy, we empower members to Decode complex vulnerabilities, Defend critical systems, and Dominate the digital cybersecurity landscape.',
        style: TextStyle(fontSize: 15, height: 1.6),
      ),
    );
  }

  Widget _buildVisionMissionSection(BuildContext context) {
    return _buildSectionContainer(
      title: '02. VISION & MISSION',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSubCard(
            title: 'VISION',
            content:
                'To build a resilient community of ethical, innovative, and security-conscious technology leaders by fostering excellence in cybersecurity education, emerging technologies, technical research, and collaborative learning.',
          ),
          const SizedBox(height: 20),
          _buildSubCard(
            title: 'MISSION',
            contentWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('• Cyber Awareness: Promote digital security best practices across the student community.'),
                SizedBox(height: 8),
                Text('• Practical Training: Provide hands-on learning through bootcamps, CTFs, and hackathons.'),
                SizedBox(height: 8),
                Text('• Innovation & Research: Encourage student research in ethical hacking, AI security, and forensics.'),
                SizedBox(height: 8),
                Text('• Industry Integration: Connect students with industry veterans, researchers, and alumni.'),
                SizedBox(height: 8),
                Text('• Ethics & Integrity: Instill a culture of ethical hacking and responsible disclosure.'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDomainsSection(BuildContext context) {
    final domains = [
      {'title': '1. Technical Team', 'desc': 'Drives CTF challenges, hands-on labs, vulnerability setup, and penetration testing methodologies.'},
      {'title': '2. Research Team', 'desc': 'Explores AI-driven threat analysis, digital forensics, cyber laws, and technical documentation.'},
      {'title': '3. Event Management Team', 'desc': 'Manages logistics, venue setup, and execution of workshops and competitions.'},
      {'title': '4. Design Team', 'desc': 'Maintains visual branding through UI/UX assets, posters, and promotional graphics.'},
      {'title': '5. Media & Marketing Team', 'desc': 'Drives external reach, PR, sponsorship liaisons, social strategy, photo/video coverage, teasers, and tutorials.'},
      {'title': '6. Documentation Team', 'desc': 'Prepares official event reports, technical write-ups, and archives club records.'},
      {'title': '7. Treasury Team', 'desc': 'Oversees budgeting, financial auditing, and transparent funding for club events.'},
    ];

    return _buildSectionContainer(
      title: '03. CORE DOMAINS',
      child: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = constraints.maxWidth > 900 ? 3 : (constraints.maxWidth > 600 ? 2 : 1);
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: domains.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.5,
            ),
            itemBuilder: (context, index) {
              final domain = domains[index];
              return _buildSubCard(
                title: domain['title']!,
                content: domain['desc']!,
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildEventsSection(BuildContext context) {
    return _buildSectionContainer(
      title: '04. MAJOR INITIATIVES & KEY EVENTS',
      child: Column(
        children: [
          _buildEventTile(
            title: 'National Level CTF Qualification (HackData 2026)',
            desc:
                'Successfully qualified for the National-Level Offline Final Round of HackData 2026 CTF at Shiv Nadar University, Delhi NCR. '
                'The team demonstrated proficiency in Web Exploitation, Cryptography, Reverse Engineering, and Digital Forensics.',
          ),
          _buildEventTile(
            title: 'Cyber Hunt 2025',
            desc:
                'Institute flagship cybersecurity puzzle competition engaging 47 teams (141 total participants) across cryptography, web security, and logic challenges.',
          ),
          _buildEventTile(
            title: 'Cybersecurity 101 Bootcamp',
            desc:
                'Comprehensive 4-day training camp covering Linux basics, networking, penetration testing, and incident response for 50+ students.',
          ),
          _buildEventTile(
            title: 'Industry Expert Talks & Summit Representation',
            desc:
                'Hosted sessions with cybersecurity veterans and officially represented AISSMS COE at the IdentityShield Cyber Security Summit 2026.',
          ),
        ],
      ),
    );
  }

  Widget _buildCollaborationsSection(BuildContext context) {
    final partners = ['MCCIA', 'miniOrange', 'ISTE', 'IETE', 'IEI'];
    return Container(
      color: const Color(0xFF12121A),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            'INDUSTRY CONNECTIONS & PARTNERSHIPS',
            style: TextStyle(fontFamily: 'monospace', color: Color(0xFF00E5FF), fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: partners
                .map((partner) => Chip(
                      backgroundColor: const Color(0xFF1A1A26),
                      side: const BorderSide(color: Color(0xFFFF2E4C)),
                      label: Text(
                        partner,
                        style: const TextStyle(color: Colors.white, fontFamily: 'monospace'),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildLeadershipSection(BuildContext context) {
    return _buildSectionContainer(
      title: '05. CLUB LEADERSHIP',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Faculty Coordinators',
            style: TextStyle(color: Color(0xFFFF2E4C), fontFamily: 'monospace', fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text('• Mrs. Ankita Gupta  |  • Mrs. Bhakti Patil'),
          const SizedBox(height: 24),
          const Text(
            'Executive Board',
            style: TextStyle(color: Color(0xFFFF2E4C), fontFamily: 'monospace', fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text('• President: Sarvesh Deshmukh'),
          const Text('• Vice-President: Atharva Urde'),
          const Text('• Technical Lead: Varad Hajare'),
          const Text('• Research Lead: Varad Hajare'),
          const Text('• Design Lead: Rudra Chandgude'),
          const Text('• Event Management Lead: Aakash Haygonde'),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      width: double.infinity,
      color: const Color(0xFF060608),
      child: Column(
        children: const [
          Text(
            'PROTOCOL Cyber Security Club © 2026 | AISSMS COE',
            style: TextStyle(color: Colors.grey, fontFamily: 'monospace', fontSize: 12),
          ),
          SizedBox(height: 8),
          Text(
            'Instagram: @protocol_cyberclub  |  Location: AISSMS COE, Pune',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionContainer({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      constraints: const BoxConstraints(maxWidth: 1100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF2E4C),
              fontFamily: 'monospace',
              letterSpacing: 1.5,
            ),
          ),
          const Divider(color: Color(0xFF222230), height: 32),
          child,
        ],
      ),
    );
  }

  Widget _buildSubCard({required String title, String? content, Widget? contentWidget}) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF12121A),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF222230)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Color(0xFF00E5FF), fontFamily: 'monospace', fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          if (content != null) Text(content, style: const TextStyle(fontSize: 13, height: 1.4)),
          if (contentWidget != null) contentWidget,
        ],
      ),
    );
  }

  Widget _buildEventTile({required String title, required String desc}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFF12121A),
        border: Border(left: BorderSide(color: Color(0xFFFF2E4C), width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 6),
          Text(desc, style: const TextStyle(color: Colors.grey, fontSize: 13, height: 1.4)),
        ],
      ),
    );
  }
}