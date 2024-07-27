import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedScaleProvider extends ChangeNotifier {
  bool _isScale = false;

  bool get isScale => _isScale;

  void scale() {
    _isScale = !_isScale;
    notifyListeners();
  }
}
