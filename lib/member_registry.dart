import 'member.dart';
import 'members/nilanga.dart';
import 'members/ramindu.dart';
import 'members/chamath.dart';
import 'members/rashmina.dart';
import 'members/gimhan.dart';
import 'members/isuru.dart';
import 'members/imasha.dart';
import 'members/sahan.dart';
import 'members/upadya.dart';

const List<MemberEntry?> memberSlots = [
  nilangaEntry,
  raminduEntry,
  chamathEntry,
  rashminaEntry,
  gimhanEntry,
  isuruEntry,
  imashaEntry,
  sahanEntry,
  upadyaEntry,
];

int get filledSlotCount => memberSlots.where((entry) => entry != null).length;
