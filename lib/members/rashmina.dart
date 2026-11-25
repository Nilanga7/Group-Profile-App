import 'package:flutter/material.dart';

import '../member.dart';
import '../widgets/favourite_button.dart';

const rashmina = Member(
  id: 'Rashmina',
  fullName: 'J A N Rashmina',
  studentId: '23IT0522',
  tagline: 'Curious learner with an eye for detail',
  address: 'Wennappuwa, Sri Lanka',
  email: 'Nawodyarashmina@gmail.com',
  photo: 'assets/images/rashmina.jpg',
  qualifications: [
    Qualification(
      title: 'G.C.E. Ordinary Level',
      place: 'Anuruddha Central College, Lunuwila',
      year: '2019',
    ),
    Qualification(
      title: 'G.C.E. Advanced Level (Technology Stream)',
      place: 'Anuruddha Central College, Lunuwila',
      year: '2022',
    ),
    Qualification(
      title: 'Certificate in DP Education IT ',
      place: 'University of Moratuwa',
      year: '2021',
    ),
    Qualification(
      title: 'NDT in Information Technology (Reading)',
      place: 'Institute of Technology, University of Moratuwa',
      year: '2023 – Present',
    ),
  ],
  softSkills: [
    'Communication',
    'Attention to Detail',
    'Teamwork',
    'Presentation',
  ],
  talents: ['Creative Writing', 'Drawing'],
);

class RashminaScreen extends StatelessWidget {
  const RashminaScreen({super.key});

  static const Color _paper = Color(0xFF151A22);
  static const Color _surface = Color(0xFF202630);
  static const Color _ink = Color(0xFFF5F7FA);
  static const Color _mutedInk = Color(0xFFC2CBD6);
  static const Color _gold = Color(0xFF08D8E8);
  static const String _font = 'sans-serif';

  static const TextStyle _heading = TextStyle(
    fontFamily: _font,
    fontSize: 14,
    letterSpacing: 1.4,
    fontWeight: FontWeight.bold,
    color: _gold,
  );

  static const TextStyle _body = TextStyle(
    fontFamily: _font,
    fontSize: 15,
    height: 1.5,
    color: _mutedInk,
  );

  @override
  Widget build(BuildContext context) {
    const m = rashmina;

    return Scaffold(
      backgroundColor: _paper,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: _surface,
              borderRadius: BorderRadius.circular(28),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x6608D8E8),
                  blurRadius: 26,
                  spreadRadius: -14,
                  offset: Offset(0, 16),
                ),
              ],
            ),
            child: ListView(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: _ink),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const Spacer(),
                    FavouriteButton(memberId: m.id, color: _gold),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: _gold,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x9908D8E8),
                            blurRadius: 16,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          m.photo,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            m.fullName,
                            style: const TextStyle(
                              fontFamily: _font,
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: _ink,
                              height: 1.1,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            m.tagline,
                            style: _body.copyWith(fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(color: Color(0xFF3A424F), thickness: 1),
                Text(
                  '${m.address}   ·   ${m.email}   ·   ${m.studentId}',
                  textAlign: TextAlign.center,
                  style: _body.copyWith(fontSize: 13),
                ),
                const Divider(color: Color(0xFF3A424F), thickness: 1),
                const SizedBox(height: 20),
                const Text('EDUCATION', style: _heading),
                const SizedBox(height: 12),
                for (int i = 0; i < m.qualifications.length; i++)
                  _TimelineItem(
                    qualification: m.qualifications[i],
                    isLast: i == m.qualifications.length - 1,
                  ),
                const SizedBox(height: 20),
                const Text('SOFT SKILLS', style: _heading),
                const SizedBox(height: 8),
                for (final s in m.softSkills) Text('—  $s', style: _body),
                if (m.talents.isNotEmpty) ...[
                  const SizedBox(height: 20),
                  const Text('SPECIAL TALENTS', style: _heading),
                  const SizedBox(height: 8),
                  Text(
                    m.talents.join('  ✦  '),
                    style: _body.copyWith(fontStyle: FontStyle.italic),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({required this.qualification, required this.isLast});

  final Qualification qualification;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 24,
            child: Column(
              children: [
                Container(
                  width: 14,
                  height: 14,
                  margin: const EdgeInsets.only(top: 3),
                  decoration: BoxDecoration(
                    color: RashminaScreen._paper,
                    shape: BoxShape.circle,
                    border: Border.all(color: RashminaScreen._gold, width: 3),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(width: 2, color: RashminaScreen._gold),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    qualification.year,
                    style: RashminaScreen._body.copyWith(
                      fontSize: 12,
                      color: RashminaScreen._gold,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    qualification.title,
                    style: RashminaScreen._body.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    qualification.place,
                    style: RashminaScreen._body.copyWith(fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const rashminaEntry = MemberEntry(
  member: rashmina,
  screen: RashminaScreen(),
  designName: 'Paper Résumé Timeline',
  accent: Color(0xFF6D4C41),
);
