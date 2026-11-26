import 'package:flutter/material.dart';

import '../member.dart';
import '../widgets/favourite_button.dart';

const imasha = Member(
  id: 'imasha',
  fullName: 'J B A I Samodee',
  studentId: '23IT0527',
  tagline: 'Calm mind, clean code',
  address: 'Beliatta, Sri Lanka',
  email: 'imashasamodee@gmail.com',
  photo: 'assets/images/Imasha.jpg',
  qualifications: [
    Qualification(
      title: 'G.C.E. Ordinary Level',
      place: 'H/Ruhunu Vijayaba College, Beliatta',
      year: '2018',
    ),
    Qualification(
      title: 'G.C.E. Advanced Level (Technology Stream)',
      place: 'H/Ruhunu Vijayaba College, Beliatta',
      year: '2021',
    ),
    Qualification(
      title: 'NDT in Information Technology (Reading)',
      place: 'Institute of Technology, University of Moratuwa',
      year: '2023 – Present',
    ),
  ],
  softSkills: ['Listening', 'Teamwork', 'Patience', 'Communication', 'Planning'],
  talents: ['Swimming', 'Surfing', 'Keyboard'],
);

class ImashaScreen extends StatelessWidget {
  const ImashaScreen({super.key});

  static const Color _deep = Color(0xFF01579B);
  static const Color _sky = Color(0xFF4FC3F7);

  @override
  Widget build(BuildContext context) {
    const m = imasha;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: _WaveClipper(),
              child: Container(
                height: 370,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(-0.6, -0.8),
                    radius: 1.4,
                    colors: [_sky, _deep],
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const BackButton(color: Colors.white),
                          const Spacer(),
                          FavouriteButton(memberId: m.id, color: Colors.white),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                        ),
                        child: CircleAvatar(
                          radius: 55,
                          backgroundImage: AssetImage(m.photo),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        m.fullName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        m.tagline,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _sectionTitle('CONTACT'),
            _iconTile(Icons.badge_outlined, 'Student ID', m.studentId),
            _iconTile(Icons.home_outlined, 'Address', m.address),
            _iconTile(Icons.email_outlined, 'Email', m.email),
            _sectionTitle('EDUCATION'),
            for (final q in m.qualifications)
              _iconTile(Icons.school_outlined, q.title, '${q.place} · ${q.year}'),
            _sectionTitle('SOFT SKILLS'),
            _HorizontalBubbles(items: m.softSkills, filled: true),
            if (m.talents.isNotEmpty) ...[
              _sectionTitle('SPECIAL TALENTS'),
              _HorizontalBubbles(items: m.talents, filled: false),
            ],
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 6),
      child: Text(
        text,
        style: const TextStyle(
          color: _deep,
          fontSize: 13,
          letterSpacing: 4,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _iconTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color(0xFFE1F5FE),
        child: Icon(icon, color: _deep),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}

class _WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 60);

    path.quadraticBezierTo(
      size.width * 0.25,
      size.height,
      size.width * 0.5,
      size.height - 40,
    );

    path.quadraticBezierTo(
      size.width * 0.75,
      size.height - 80,
      size.width,
      size.height - 30,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _HorizontalBubbles extends StatelessWidget {
  const _HorizontalBubbles({required this.items, required this.filled});

  final List<String> items;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        itemCount: items.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              color: filled ? ImashaScreen._deep : Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: ImashaScreen._deep, width: 2),
            ),
            child: Text(
              items[index],
              style: TextStyle(
                color: filled ? Colors.white : ImashaScreen._deep,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        },
      ),
    );
  }
}

const imashaEntry = MemberEntry(
  member: imasha,
  screen: ImashaScreen(),
  designName: 'Ocean Wave',
  accent: Color(0xFF0277BD),
);
