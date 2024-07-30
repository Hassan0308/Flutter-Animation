import 'package:flutter/material.dart';

class Matrix4Transformation1Provider with ChangeNotifier {
  double _x = 0;
  double _y = 0;
  double _z = 0;

  double get x => _x;
  double get y => _y;
  double get z => _z;

  void rotate(double x, double y) {
    _x = x;
    _y = y;
    notifyListeners();
  }
}
