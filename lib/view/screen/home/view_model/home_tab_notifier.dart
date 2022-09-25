import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedHomeTapNotifier with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

final selectedIndexProvider =
    ChangeNotifierProvider<SelectedHomeTapNotifier>((ref) {
  return SelectedHomeTapNotifier();
});
