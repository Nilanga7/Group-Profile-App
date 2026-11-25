import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../member.dart';
import '../widgets/favourite_button.dart';

const nilanga = Member(
  id: 'nilanga',
  fullName: 'K M N I Ranasinghe',
  studentId: '23IT0520',
  tagline: 'IT Student · Aspiring Software Engineer',
  address: 'Kurunegala, Sri Lanka',
  email: 'nilangaranasinghe05@gmail.com',
  photo: 'assets/images/Nilanga.jpeg',
  qualifications: [
    Qualification(
      title: 'G.C.E. Ordinary Level',
      place: 'Ibbagamuwa Central College',
      year: '2019',
    ),
    Qualification(
      title: 'G.C.E. Advanced Level',
      place: 'Ibbagamuwa Central College',
      year: '2023',
    ),
    Qualification(
      title: 'Higher National Diploma in Information Technology',
      place: 'Institute of Technology, University of Moratuwa',
      year: '2025 – Present',
    ),
  ],
  softSkills: ['Teamwork', 'Communication', 'Leadership', 'Time Management'],
  talents: ['Photo editing', 'Graphic design'],
);

class NilangaScreen extends StatelessWidget {
  const NilangaScreen({super.key});

  static const Color _start = Color(0xFF3949AB);
  static const Color _end = Color(0xFF8E24AA);
  static const Color _background = Color(0xFFF3EFFA);
  static const Color _soft = Color(0xFFEDE7F6);
  static const Color _ink = Color(0xFF1F1B2E);

  static const LinearGradient _gradient = LinearGradient(
    colors: [_start, _end],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  void _copyEmail(BuildContext context, String email) {
    Clipboard.setData(ClipboardData(text: email));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Email copied'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: _start,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const m = nilanga;

    return Scaffold(
      backgroundColor: _background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: 240,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    gradient: _gradient,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(48),
                    ),
                  ),
                  child: const Stack(
                    children: [
                      Positioned(
                        top: -40,
                        right: -30,
                        child: _Bubble(size: 160),
                      ),
                      Positioned(
                        top: 90,
                        left: -50,
                        child: _Bubble(size: 130),
                      ),
                      Positioned(
                        bottom: 30,
                        right: 40,
                        child: _Bubble(size: 50),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SafeArea(
                    child: Row(
                      children: [
                        const BackButton(color: Colors.white),
                        const Expanded(
                          child: Text(
                            'NILANGA',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white70,
                              letterSpacing: 3,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        FavouriteButton(memberId: m.id, color: Colors.white),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -66,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color(0xFFFFD54F), _end],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x553949AB),
                          blurRadius: 20,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(m.photo),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                m.fullName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: _ink,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                m.tagline,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: _end,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                _InfoPill(icon: Icons.badge_outlined, text: m.studentId),
                _InfoPill(
                  icon: Icons.location_on_outlined,
                  text: m.address.split(',').first,
                ),
              ],
            ),
            const SizedBox(height: 20),
            _SectionCard(
              title: 'Contact',
              icon: Icons.contact_mail_rounded,
              child: Column(
                children: [
                  _ContactRow(
                    icon: Icons.home_rounded,
                    label: 'Address',
                    value: m.address,
                  ),
                  const SizedBox(height: 10),
                  _ContactRow(
                    icon: Icons.alternate_email_rounded,
                    label: 'Email  ·  tap to copy',
                    value: m.email,
                    trailing: Icons.copy_rounded,
                    onTap: () => _copyEmail(context, m.email),
                  ),
                ],
              ),
            ),
            _SectionCard(
              title: 'Academic Qualifications',
              icon: Icons.school_rounded,
              child: Column(
                children: [
                  for (int i = 0; i < m.qualifications.length; i++) ...[
                    if (i > 0) const Divider(height: 24, color: _soft),
                    _QualificationRow(
                      number: i + 1,
                      qualification: m.qualifications[i],
                    ),
                  ],
                ],
              ),
            ),
            _SectionCard(
              title: 'Soft Skills',
              icon: Icons.psychology_rounded,
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final skill in m.softSkills) _GradientPill(text: skill),
                ],
              ),
            ),
            if (m.talents.isNotEmpty)
              _SectionCard(
                title: 'Special Talents',
                icon: Icons.auto_awesome_rounded,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final talent in m.talents)
                      _OutlinePill(text: talent),
                  ],
                ),
              ),
            const SizedBox(height: 16),
            const Text(
              'Group 8  ·  Mobile Communication CA 02',
              style: TextStyle(color: Colors.black38, fontSize: 12),
            ),
            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0x1FFFFFFF),
      ),
    );
  }
}

class _InfoPill extends StatelessWidget {
  const _InfoPill({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Color(0x143949AB),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: NilangaScreen._end),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: NilangaScreen._ink,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.icon,
    required this.child,
  });

  final String title;
  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A3949AB),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: NilangaScreen._gradient,
                ),
                child: Icon(icon, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: NilangaScreen._ink,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({
    required this.icon,
    required this.label,
    required this.value,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final String value;
  final IconData? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: NilangaScreen._soft,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: NilangaScreen._end),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(fontSize: 12, color: Colors.black45),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: NilangaScreen._ink,
                    ),
                  ),
                ],
              ),
            ),
            if (trailing != null)
              Icon(trailing, size: 18, color: NilangaScreen._start),
          ],
        ),
      ),
    );
  }
}

class _QualificationRow extends StatelessWidget {
  const _QualificationRow({required this.number, required this.qualification});

  final int number;
  final Qualification qualification;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: NilangaScreen._gradient,
          ),
          child: Text(
            '$number',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                qualification.title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: NilangaScreen._ink,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                qualification.place,
                style: const TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: NilangaScreen._soft,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  qualification.year,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: NilangaScreen._end,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _GradientPill extends StatelessWidget {
  const _GradientPill({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      decoration: BoxDecoration(
        gradient: NilangaScreen._gradient,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle_rounded, size: 16, color: Colors.white),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _OutlinePill extends StatelessWidget {
  const _OutlinePill({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: NilangaScreen._end, width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star_rounded, size: 18, color: NilangaScreen._end),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              color: NilangaScreen._end,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

const nilangaEntry = MemberEntry(
  member: nilanga,
  screen: NilangaScreen(),
  designName: 'Gradient Header & Cards',
  accent: Color(0xFF5E35B1),
);