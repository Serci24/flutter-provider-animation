import 'package:flutter/material.dart';

class AnimationModel extends ChangeNotifier {
  getValue(size) {
    notifyListeners();
    return size;
  }
}
