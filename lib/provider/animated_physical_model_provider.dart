import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedPhysicalModelProvider extends ChangeNotifier {
  bool _isElevated = false;

  bool get isElevated => _isElevated;

  void toggleElevation() {
    _isElevated = !_isElevated;
    notifyListeners();
  }
}
