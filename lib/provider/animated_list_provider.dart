import 'package:flutter/material.dart';

class AnimatedListProvider with ChangeNotifier {
  bool _isStartAnimation = false;
  bool get isStartAnimation => _isStartAnimation;

  void startAnimation() {
    _isStartAnimation = true;
    notifyListeners();
  }
}
