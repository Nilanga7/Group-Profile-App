import 'package:flutter/material.dart';

import '../member.dart';
import '../widgets/favourite_button.dart';

const ramindu = Member(
  id: 'ramindu',
  fullName: 'W A C Ramindu',
  studentId: '23IT0519',
  tagline: 'Problem solver · Team player',
  address: '535/3,Gehenuwala,Meegoda, Sri Lanka',
  email: 'charukaramindu10@gmail.com',
  photo: 'assets/images/ramindu.jpg',
  qualifications: [
    Qualification(
      title: 'G.C.E. Ordinary Level',
      place: 'Meegoda Dharmaraja Vidyalaya',
      year: '2019',
    ),
    Qualification(
      title: 'G.C.E. Advanced Level (Technology Stream)',
      place: 'Hanwella Rajasinghe Central College',
      year: '2022',
    ),
    Qualification(
      title: 'NDT in Information Technology (Reading)',
      place: 'Institute of Technology, University of Moratuwa',
      year: '2023 – Present',
    ),
  ],
  softSkills: ['Teamwork', 'Communication', 'Critical Thinking', 'Adaptability'],
  talents: ['Singing', 'Badminton'],
);

class RaminduScreen extends StatelessWidget {
  const RaminduScreen({super.key});

  static const Color _teal = Color(0xFF00796B);
  static const Color _mint = Color(0xFFE0F2F1);
  static const String _font = 'sans-serif-condensed';

  @override
  Widget build(BuildContext context) {
    const m = ramindu;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: _mint,
        appBar: AppBar(
          backgroundColor: _teal,
          foregroundColor: Colors.white,
          title: const Text('Profile', style: TextStyle(fontFamily: _font)),
          actions: [FavouriteButton(memberId: m.id, color: Colors.white)],
        ),
        body: Column(
          children: [
            Container(
              color: _teal,
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      m.photo,
                      width: 96,
                      height: 96,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          m.fullName,
                          style: const TextStyle(
                            fontFamily: _font,
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          m.tagline,
                          style: const TextStyle(
                            fontFamily: _font,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Material(
              color: Colors.white,
              child: TabBar(
                labelColor: _teal,
                unselectedLabelColor: Colors.black45,
                indicatorColor: _teal,
                labelStyle: TextStyle(fontFamily: _font, fontSize: 15),
                tabs: [
                  Tab(icon: Icon(Icons.person), text: 'About'),
                  Tab(icon: Icon(Icons.school), text: 'Studies'),
                  Tab(icon: Icon(Icons.psychology), text: 'Skills'),
                  Tab(icon: Icon(Icons.star), text: 'Talents'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _AboutTab(member: m),
                  _StudiesTab(member: m),
                  _TileGrid(items: m.softSkills, icon: Icons.check_circle),
                  m.talents.isEmpty
                      ? const Center(child: Text('No special talents listed'))
                      : _TileGrid(items: m.talents, icon: Icons.emoji_events),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AboutTab extends StatelessWidget {
  const _AboutTab({required this.member});

  final Member member;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _infoRow(Icons.badge, 'Student ID', member.studentId),
        _infoRow(Icons.location_city, 'Address', member.address),
        _infoRow(Icons.alternate_email, 'Email', member.email),
      ],
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              left: BorderSide(color: RaminduScreen._teal, width: 5),
            ),
          ),
          child: Row(
            children: [
              Icon(icon, color: RaminduScreen._teal),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontFamily: RaminduScreen._font,
                        color: Colors.black45,
                      ),
                    ),
                    Text(
                      value,
                      style: const TextStyle(
                        fontFamily: RaminduScreen._font,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StudiesTab extends StatelessWidget {
  const _StudiesTab({required this.member});

  final Member member;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: member.qualifications.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final q = member.qualifications[index];
        return ListTile(
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          leading: CircleAvatar(
            backgroundColor: RaminduScreen._teal,
            foregroundColor: Colors.white,
            child: Text('${index + 1}'),
          ),
          title: Text(
            q.title,
            style: const TextStyle(fontFamily: RaminduScreen._font),
          ),
          subtitle: Text(q.place),
          trailing: Text(
            q.year,
            style: const TextStyle(color: RaminduScreen._teal),
          ),
        );
      },
    );
  }
}

class _TileGrid extends StatelessWidget {
  const _TileGrid({required this.items, required this.icon});

  final List<String> items;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(20),
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.4,
      children: [
        for (final item in items)
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: RaminduScreen._teal, width: 1.5),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: RaminduScreen._teal, size: 30),
                const SizedBox(height: 6),
                Text(
                  item,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: RaminduScreen._font,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

const raminduEntry = MemberEntry(
  member: ramindu,
  screen: RaminduScreen(),
  designName: 'Tabbed Profile',
  accent: Color(0xFF00796B),
);
