import 'package:flutter/foundation.dart';

class FavouritesController extends ChangeNotifier {
  final Set<String> _favouriteIds = {};

  int get count => _favouriteIds.length;

  bool isFavourite(String memberId) => _favouriteIds.contains(memberId);

  void toggle(String memberId) {
    if (_favouriteIds.contains(memberId)) {
      _favouriteIds.remove(memberId);
    } else {
      _favouriteIds.add(memberId);
    }
    notifyListeners();
  }

  void clear() {
    _favouriteIds.clear();
    notifyListeners();
  }
}
