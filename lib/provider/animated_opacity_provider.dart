import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedOpacityProider extends ChangeNotifier {
  bool _flag = true;

  bool get flag => _flag;

  void toggle() {
    _flag = !_flag;
    notifyListeners();
  }
}
