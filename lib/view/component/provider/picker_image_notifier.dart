import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PickerImageNotifier extends ChangeNotifier {
  File? _fileAvatar;
  File? get fileAvatar => _fileAvatar;

  File? _fileCover;
  File? get fileCover => _fileCover;

  void pickedFirstAvatarImage(File? fileAvatar) {
    _fileAvatar = fileAvatar;
    notifyListeners();
  }

  void pickedFirstCoverImage(File? fileCover) {
    _fileCover = fileCover;
    notifyListeners();
  }
}

final pickerImageProvider = ChangeNotifierProvider<PickerImageNotifier>((ref) {
  return PickerImageNotifier();
});