import 'package:flutter/material.dart';

class Qualification {
  const Qualification({
    required this.title,
    required this.place,
    required this.year,
  });

  final String title;
  final String place;
  final String year;
}

class Member {
  const Member({
    required this.id,
    required this.fullName,
    required this.studentId,
    required this.tagline,
    required this.address,
    required this.email,
    required this.photo,
    required this.qualifications,
    required this.softSkills,
    this.talents = const [],
  });

  final String id;
  final String fullName;
  final String studentId;
  final String tagline;
  final String address;
  final String email;
  final String photo;
  final List<Qualification> qualifications;
  final List<String> softSkills;
  final List<String> talents;
}

class MemberEntry {
  const MemberEntry({
    required this.member,
    required this.screen,
    required this.designName,
    required this.accent,
  });

  final Member member;
  final Widget screen;
  final String designName;
  final Color accent;
}
