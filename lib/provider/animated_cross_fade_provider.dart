import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedCrossFadeProvider extends ChangeNotifier {
  bool _fade = true;

  bool get fade => _fade;

  void toggleFade() {
    _fade = !_fade;
    notifyListeners();
  }
}
