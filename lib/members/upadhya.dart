import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

import '../member.dart';
import '../widgets/favourite_button.dart';

const upadhya = Member(
  id: 'upadhya',
  fullName: 'K T S U Senanayaka',
  studentId: '23IT0532',
  tagline: 'Quietly building great things',
  address: 'Your City, Sri Lanka',
  email: 'your.email@example.com',
  photo: 'assets/images/upadhya.jpeg',
  qualifications: [
    Qualification(
      title: 'G.C.E. Ordinary Level',
      place: 'Your School',
      year: '2018',
    ),
    Qualification(
      title: 'G.C.E. Advanced Level (Technology Stream)',
      place: 'Your School',
      year: '2021',
    ),
    Qualification(
      title: 'NDT in Information Technology (Reading)',
      place: 'Institute of Technology, University of Moratuwa',
      year: '2023 – Present',
    ),
  ],
  softSkills: ['Leadership', 'Conflict Resolution', 'Teamwork', 'Time Management'],
  talents: ['Music Production', 'Football'],
);

class UpadhyaScreen extends StatefulWidget {
  const UpadhyaScreen({super.key});

  @override
  State<UpadhyaScreen> createState() => _UpadhyaScreenState();
}

class _UpadhyaScreenState extends State<UpadhyaScreen> {
  static const Color _gold = Color(0xFFFFD54F);
  static const Color _glass = Color(0x33FFFFFF);
  static const Color _glassBorder = Color(0x66FFFFFF);

  int _section = 0;

  @override
  Widget build(BuildContext context) {
    const m = upadhya;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [FavouriteButton(memberId: m.id, color: _gold)],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: Image.asset(m.photo, fit: BoxFit.cover),
            ),
          ),
          Positioned.fill(
            child: Container(color: const Color(0x88000000)),
          ),
          SafeArea(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 32),
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: _gold, width: 2),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: CircleAvatar(
                      radius: 64,
                      backgroundImage: AssetImage(m.photo),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  m.fullName.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  m.tagline,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: _gold, letterSpacing: 1.5),
                ),
                const SizedBox(height: 22),
                Center(
                  child: ToggleButtons(
                    isSelected: [_section == 0, _section == 1, _section == 2],
                    onPressed: (index) {
                      setState(() {
                        _section = index;
                      });
                    },
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white70,
                    selectedColor: Colors.black,
                    fillColor: _gold,
                    borderColor: _glassBorder,
                    selectedBorderColor: _gold,
                    constraints: const BoxConstraints(minHeight: 40, minWidth: 92),
                    children: const [
                      Text('INFO'),
                      Text('STUDIES'),
                      Text('SKILLS'),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: _glass,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: _glassBorder),
                      ),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: KeyedSubtree(
                          key: ValueKey(_section),
                          child: _buildSection(m),
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

  Widget _buildSection(Member m) {
    switch (_section) {
      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final q in m.qualifications)
              _glassRow(Icons.school, q.title, '${q.place}\n${q.year}'),
          ],
        );
      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _label('SOFT SKILLS'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [for (final s in m.softSkills) _glassChip(s)],
            ),
            if (m.talents.isNotEmpty) ...[
              const SizedBox(height: 20),
              _label('SPECIAL TALENTS'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [for (final t in m.talents) _glassChip(t)],
              ),
            ],
          ],
        );
      default:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _glassRow(Icons.badge_outlined, 'Student ID', m.studentId),
            _glassRow(Icons.location_on_outlined, 'Address', m.address),
            _glassRow(Icons.mail_outline, 'Email', m.email),
          ],
        );
    }
  }

  Widget _label(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: _gold,
        fontSize: 12,
        letterSpacing: 4,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _glassRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: _gold),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(value, style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _glassChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: _glass,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _glassBorder),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}

const upadhyaEntry = MemberEntry(
  member: upadhya,
  screen: UpadhyaScreen(),
  designName: 'Frosted Glass',
  accent: Color(0xFF37474F),
);
