import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class PickerNotifier extends ChangeNotifier {
  XFile? _xFile;
  XFile? get xFile => _xFile;

  void pickedImage(XFile xFile) {
    _xFile = xFile;
    notifyListeners();
  }
}

final pickerImageProvider = ChangeNotifierProvider<PickerNotifier>((ref) {
  return PickerNotifier();
});
