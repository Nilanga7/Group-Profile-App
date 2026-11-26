import 'package:flutter/material.dart';

import '../member.dart';
import '../widgets/favourite_button.dart';

const isuru = Member(
  id: 'isuru',
  fullName: 'R M I C Rathnayake',
  studentId: '23IT0524',
  tagline: 'Designer at heart, developer by trade',
  address: 'Maho, Sri Lanka',
  email: 'rmisuruchanaka@gmail.com',
  photo: 'assets/images/isuru.jpg',
  qualifications: [
    Qualification(
      title: 'G.C.E. Ordinary Level',
      place: 'Maliyadeva College',
      year: '2017',
    ),
    Qualification(
      title: 'G.C.E. Advanced Level (Maths Stream)',
      place: 'Maliyadeva College',
      year: '2020',
    ),
    Qualification(
      title: 'NDT in Information Technology (Reading)',
      place: 'Institute of Technology, University of Moratuwa',
      year: '2023 – Present',
    ),
  ],
  softSkills: ['Creativity', 'Teamwork', 'Communication', 'Time Management'],
  talents: ['Graphic Design', 'Photography', 'Videography'],
);

class IsuruScreen extends StatefulWidget {
  const IsuruScreen({super.key});

  @override
  State<IsuruScreen> createState() => _IsuruScreenState();
}

class _IsuruScreenState extends State<IsuruScreen> {
  static const Color _bg = Color(0xFF121212);
  static const Color _orange = Color(0xFFFF7043);
  static const Color _pink = Color(0xFFEC407A);
  static const Color _yellow = Color(0xFFFFCA28);
  static const Color _cyan = Color(0xFF26C6DA);
  static const Color _tile = Color(0xFF1F1F1F);

  static const List<Color> _skillColors = [_orange, _pink, _yellow, _cyan];

  int? _tappedSkill;

  TextStyle _label(Color color) => TextStyle(
        color: color,
        fontSize: 11,
        letterSpacing: 2,
        fontWeight: FontWeight.w900,
      );

  @override
  Widget build(BuildContext context) {
    const m = isuru;

    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        backgroundColor: _bg,
        foregroundColor: Colors.white,
        title: const Text(
          'PROFILE',
          style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 4),
        ),
        actions: [FavouriteButton(memberId: m.id, color: _pink)],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(
              height: 220,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(m.photo, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: _box(
                            color: _orange,
                            child: Text(
                              m.fullName.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        _box(
                          color: _yellow,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('STUDENT ID', style: _label(Colors.black54)),
                              Text(
                                m.studentId,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _box(
              color: _tile,
              border: _cyan,
              child: Text(
                '"${m.tagline}"',
                style: const TextStyle(
                  color: _cyan,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _box(
                    color: _tile,
                    child: _iconText(Icons.place, 'ADDRESS', m.address, _pink),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _box(
                    color: _tile,
                    child: _iconText(Icons.mail, 'EMAIL', m.email, _yellow),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 2.2,
              children: [
                for (int i = 0; i < m.softSkills.length; i++)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _tappedSkill = _tappedSkill == i ? null : i;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _tappedSkill == i
                            ? _skillColors[i % _skillColors.length]
                            : _tile,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: _skillColors[i % _skillColors.length],
                          width: 2,
                        ),
                      ),
                      child: Text(
                        m.softSkills[i].toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _tappedSkill == i
                              ? Colors.black
                              : _skillColors[i % _skillColors.length],
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            _box(
              color: _tile,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('EDUCATION', style: _label(_orange)),
                  const SizedBox(height: 8),
                  for (final q in m.qualifications)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 60,
                            child: Text(
                              q.year.split(' ').first,
                              style: const TextStyle(
                                color: _orange,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${q.title}\n${q.place}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            if (m.talents.isNotEmpty) ...[
              const SizedBox(height: 12),
              _box(
                color: _pink,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('SPECIAL TALENTS', style: _label(Colors.black54)),
                    const SizedBox(height: 6),
                    Text(
                      m.talents.join(' / ').toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _box({required Color color, required Widget child, Color? border}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
        border: border == null ? null : Border.all(color: border, width: 2),
      ),
      child: child,
    );
  }

  Widget _iconText(IconData icon, String label, String value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 6),
        Text(label, style: _label(color)),
        Text(value, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}

const isuruEntry = MemberEntry(
  member: isuru,
  screen: IsuruScreen(),
  designName: 'Neon Bento Grid',
  accent: Color(0xFFFF7043),
);
