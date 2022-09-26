import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScrollNotifier with ChangeNotifier {
  double _scrollPosition = 0.0;
  int _position = 0;
  double _offset = 0.0;

  double get scrollPosition => _scrollPosition;
  int get position => _position;
  double get offset => _offset;

  void scrollable(ScrollController scrollController) {
    _scrollPosition = scrollController.position.pixels;
    _position = _scrollPosition.toInt();
    _offset = scrollController.offset;
    notifyListeners();
  }
}

final scrollableProvider = ChangeNotifierProvider<ScrollNotifier>((ref) {
  return ScrollNotifier();
});
