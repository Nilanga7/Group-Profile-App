import 'package:flutter/material.dart';

import '../member.dart';
import '../widgets/favourite_button.dart';

const sahan = Member(
  id: 'Sahan',
  fullName: 'J A S Samuditha',
  studentId: '23IT0528',
  tagline: 'Turning ideas into apps',
  address: 'Ambalantota, Sri Lanka',
  email: 'sahansamuditha0714@gmail.com',
  photo: 'assets/images/Sahan.jpeg',
  qualifications: [
    Qualification(
      title: 'G.C.E. Ordinary Level',
      place: 'H/Vijayaba National School Hungama',
      year: '2018',
    ),
    Qualification(
      title: 'G.C.E. Advanced Level (Technology Stream)',
      place: 'H/Vijayaba National School Hungama',
      year: '2021',
    ),
    Qualification(
      title: 'NDT in Information Technology (Reading)',
      place: 'Institute of Technology, University of Moratuwa',
      year: '2023 – Present',
    ),
  ],
  softSkills: ['Communication', 'Creativity', 'Teamwork', 'Negotiation'],
  talents: ['Classical Dance', 'Painting'],
);

class SahanScreen extends StatefulWidget {
  const SahanScreen({super.key});

  @override
  State<SahanScreen> createState() => _SahanScreenState();
}

class _SahanScreenState extends State<SahanScreen> {
  static const Color _rose = Color(0xFFFCE4EC);
  static const Color _magenta = Color(0xFF880E4F);
  static const Color _pink = Color(0xFFF48FB1);
  static const String _bodyFont = 'casual';

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goTo(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    const m = sahan;

    final pages = <Widget>[
      _introCard(m),
      _listCard('Contact', Icons.contact_phone, [
        'Student ID: ${m.studentId}',
        'Address: ${m.address}',
        'Email: ${m.email}',
      ]),
      _listCard('Education', Icons.school, [
        for (final q in m.qualifications) '${q.title}\n${q.place} (${q.year})',
      ]),
      _listCard('Soft Skills', Icons.psychology, m.softSkills),
      if (m.talents.isNotEmpty)
        _listCard('Special Talents', Icons.auto_awesome, m.talents),
    ];

    return Scaffold(
      backgroundColor: _rose,
      appBar: AppBar(
        backgroundColor: _rose,
        foregroundColor: _magenta,
        title: Text('${_currentPage + 1} / ${pages.length}'),
        centerTitle: true,
        actions: [FavouriteButton(memberId: m.id, color: _magenta)],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: pages,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < pages.length; i++)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: i == _currentPage ? 26 : 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: i == _currentPage ? _magenta : _pink,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
            child: Row(
              children: [
                OutlinedButton.icon(
                  onPressed:
                      _currentPage == 0 ? null : () => _goTo(_currentPage - 1),
                  icon: const Icon(Icons.chevron_left),
                  label: const Text('Prev'),
                ),
                const Spacer(),
                FilledButton.icon(
                  style: FilledButton.styleFrom(backgroundColor: _magenta),
                  onPressed: _currentPage == pages.length - 1
                      ? null
                      : () => _goTo(_currentPage + 1),
                  icon: const Icon(Icons.chevron_right),
                  label: const Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardShell({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: _magenta,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(48),
            bottomRight: Radius.circular(48),
            topRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x55880E4F),
              blurRadius: 18,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: child,
      ),
    );
  }

  Widget _introCard(Member m) {
    return _cardShell(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                child: Image.asset(
                  m.photo,
                  width: 180,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                m.fullName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'cursive',
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                m.tagline,
                textAlign: TextAlign.center,
                style: const TextStyle(fontFamily: _bodyFont, color: _pink),
              ),
              const SizedBox(height: 20),
              const Text(
                'Swipe for more  →',
                style: TextStyle(fontFamily: _bodyFont, color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listCard(String title, IconData icon, List<String> lines) {
    return _cardShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: _pink, size: 40),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'cursive',
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          const Divider(color: _pink),
          Expanded(
            child: ListView(
              children: [
                for (final line in lines)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('❀  ', style: TextStyle(color: _pink)),
                        Expanded(
                          child: Text(
                            line,
                            style: const TextStyle(
                              fontFamily: _bodyFont,
                              color: Colors.white,
                              fontSize: 16,
                            ),
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
    );
  }
}

const sahanEntry = MemberEntry(
  member: sahan,
  screen: SahanScreen(),
  designName: 'Swipe Cards',
  accent: Color(0xFFAD1457),
);
