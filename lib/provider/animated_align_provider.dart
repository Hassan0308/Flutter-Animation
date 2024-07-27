import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedAlignProvider extends ChangeNotifier {
  bool _flag = true;

  bool get flag => _flag;

  void toggle() {
    _flag = !_flag;
    notifyListeners();
  }
}
