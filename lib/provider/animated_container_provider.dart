import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedContainerProider extends ChangeNotifier {
  bool _flag = true;

  bool get flag => _flag;

  void toggleContainer() {
    _flag = !_flag;
    notifyListeners();
  }
}
