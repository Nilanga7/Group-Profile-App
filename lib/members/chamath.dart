import 'package:flutter/material.dart';

import '../member.dart';
import '../widgets/favourite_button.dart';

const chamath = Member(
  id: 'chamath',
  fullName: 'V P C Rasanga',
  studentId: '23IT0521',
  tagline: 'Code. Coffee. Repeat.',
  address: 'pitabeddara, Sri Lanka',
  email: 'vpcremail@example.com',
  photo: 'assets/images/chamath.jpg',
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
  softSkills: ['Problem Solving', 'Teamwork', 'Self-learning', 'Time Management'],
  talents: ['Chess', 'Gaming', 'Guitar'],
);

class ChamathScreen extends StatefulWidget {
  const ChamathScreen({super.key});

  @override
  State<ChamathScreen> createState() => _ChamathScreenState();
}

class _ChamathScreenState extends State<ChamathScreen> {
  static const Color _bg = Color(0xFF0D1117);
  static const Color _panel = Color(0xFF161B22);
  static const Color _green = Color(0xFF39FF14);
  static const Color _amber = Color(0xFFFFC107);
  static const String _font = 'monospace';

  bool _expandAll = false;
  bool _showEmail = false;

  TextStyle _mono({Color color = _green, double size = 14, bool bold = false}) {
    return TextStyle(
      fontFamily: _font,
      color: color,
      fontSize: size,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    );
  }

  @override
  Widget build(BuildContext context) {
    const m = chamath;

    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        backgroundColor: _bg,
        foregroundColor: _green,
        title: Text('~/team/chamath', style: _mono(size: 16)),
        actions: [
          IconButton(
            tooltip: _expandAll ? 'Collapse all' : 'Expand all',
            icon: Icon(_expandAll ? Icons.unfold_less : Icons.unfold_more),
            onPressed: () {
              setState(() {
                _expandAll = !_expandAll;
              });
            },
          ),
          FavouriteButton(memberId: m.id, color: _amber),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: _panel,
              border: Border.all(color: _green),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: _amber, width: 2),
                  ),
                  child: Image.asset(
                    m.photo,
                    width: 90,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('\$ whoami', style: _mono(color: _amber)),
                      const SizedBox(height: 6),
                      Text(m.fullName, style: _mono(size: 18, bold: true)),
                      const SizedBox(height: 6),
                      Text('// ${m.tagline}', style: _mono(color: Colors.white54)),
                      const SizedBox(height: 6),
                      Text('id: ${m.studentId}', style: _mono(color: Colors.white70)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _section(
            index: 0,
            title: 'contact.json',
            icon: Icons.terminal,
            children: [
              _line('address', m.address),
              Row(
                children: [
                  Expanded(
                    child: _line(
                      'email',
                      _showEmail ? m.email : '********  (hidden)',
                    ),
                  ),
                  Switch(
                    value: _showEmail,
                    activeTrackColor: _green,
                    onChanged: (value) {
                      setState(() {
                        _showEmail = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          _section(
            index: 1,
            title: 'education.log',
            icon: Icons.school,
            children: [
              for (final q in m.qualifications)
                _line('[${q.year}]', '${q.title}\n    @ ${q.place}'),
            ],
          ),
          _section(
            index: 2,
            title: 'soft_skills.txt',
            icon: Icons.psychology,
            children: [
              for (final s in m.softSkills) _line('+', s),
            ],
          ),
          if (m.talents.isNotEmpty)
            _section(
              index: 3,
              title: 'talents.sh',
              icon: Icons.star,
              children: [
                for (final t in m.talents) _line('>', t),
              ],
            ),
          const SizedBox(height: 12),
          Text('_ end of file', style: _mono(color: Colors.white38)),
        ],
      ),
    );
  }

  Widget _section({
    required int index,
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: _panel,
        border: Border.all(color: Colors.white24),
      ),
      child: ExpansionTile(
        key: ValueKey('section-$index-$_expandAll'),
        initiallyExpanded: _expandAll,
        leading: Icon(icon, color: _amber),
        iconColor: _green,
        collapsedIconColor: _green,
        shape: const Border(),
        collapsedShape: const Border(),
        title: Text(title, style: _mono(bold: true)),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _line(String key, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: '$key  ', style: _mono(color: _amber)),
            TextSpan(text: value, style: _mono(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

const chamathEntry = MemberEntry(
  member: chamath,
  screen: ChamathScreen(),
  designName: 'Dark Terminal',
  accent: Color(0xFF2E7D32),
);
