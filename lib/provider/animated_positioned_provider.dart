import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedPositionedProvider extends ChangeNotifier {
  bool _ismove = false;

  bool get ismove => _ismove;

  void move() {
    _ismove = !_ismove;
    notifyListeners();
  }
}
