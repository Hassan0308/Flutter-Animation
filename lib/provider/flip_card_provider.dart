import 'package:flutter/material.dart';

class FlipCardProvider with ChangeNotifier {
  bool isFlipped = false;
  bool celebration = false;

  void flip() {
    isFlipped = !isFlipped;
    notifyListeners();
  }

  void triggerCelebration() {
    celebration = true;
    notifyListeners();
  }

  void resetCelebration() {
    celebration = false;
    notifyListeners();
  }
}
