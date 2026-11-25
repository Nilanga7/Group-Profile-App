import 'package:flutter/material.dart';

import '../member.dart';
import '../widgets/favourite_button.dart';

const rashmina = Member(
  id: 'rashmina',
  fullName: 'J A N Rashmina',
  studentId: '23IT0522',
  tagline: 'Curious learner with an eye for detail',
  address: 'Your City, Sri Lanka',
  email: 'Nawodyarashmina@gmail.com',
  photo: 'assets/images/rashmina.jpg',
  qualifications: [
    Qualification(
      title: 'G.C.E. Ordinary Level',
      place: 'Anuruddha Central College, Lunuwila',
      year: '2018',
    ),
    Qualification(
      title: 'G.C.E. Advanced Level (Technology Stream)',
      place: 'Anuruddha Central College, Lunuwila',
      year: '2021',
    ),
    Qualification(
      title: 'Certificate in English',
      place: 'University of Moratuwa',
      year: '2022',
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

  static const Color _paper = Color(0xFFFAF3E0);
  static const Color _ink = Color(0xFF4E342E);
  static const Color _gold = Color(0xFFC8A04A);
  static const String _font = 'serif';

  static const TextStyle _heading = TextStyle(
    fontFamily: _font,
    fontSize: 15,
    letterSpacing: 3,
    fontWeight: FontWeight.bold,
    color: _gold,
  );

  static const TextStyle _body = TextStyle(
    fontFamily: _font,
    fontSize: 15,
    height: 1.4,
    color: _ink,
  );

  @override
  Widget build(BuildContext context) {
    const m = rashmina;

    return Scaffold(
      backgroundColor: _paper,
      body: SafeArea(
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
                FavouriteButton(memberId: m.id, color: _ink),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    color: _gold,
                    shape: BoxShape.circle,
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
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: _ink,
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
            const Divider(color: _ink, thickness: 1.5),
            Text(
              '${m.address}   ·   ${m.email}   ·   ${m.studentId}',
              textAlign: TextAlign.center,
              style: _body.copyWith(fontSize: 13),
            ),
            const Divider(color: _ink, thickness: 1.5),
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
