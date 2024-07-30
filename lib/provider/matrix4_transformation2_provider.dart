import 'dart:math';
import 'package:flutter/material.dart';

class Matrix4Transformation2Provider with ChangeNotifier {
  late Animation<double> _animation1;
  late Animation<double> _animation2;

  late CurvedAnimation _curvedAnimation1;
  late CurvedAnimation _curvedAnimation2;

  late AnimationController _controller1;
  late AnimationController _controller2;

  bool _isAnimation1Complete = false;

  // Provide getters for animations and controllers
  Animation<double> get animation1 => _animation1;
  Animation<double> get animation2 => _animation2;

  CurvedAnimation get curvedAnimation1 => _curvedAnimation1;
  CurvedAnimation get curvedAnimation2 => _curvedAnimation2;

  AnimationController get controller1 => _controller1;
  AnimationController get controller2 => _controller2;

  bool get isAnimation1Complete => _isAnimation1Complete;

  void initializeAnimation(TickerProviderStateMixin ticker) {
    _controller1 = AnimationController(
        vsync: ticker, duration: const Duration(seconds: 1));
    _controller2 = AnimationController(
        vsync: ticker, duration: const Duration(seconds: 2));

    _curvedAnimation1 =
        CurvedAnimation(parent: _controller1, curve: Curves.easeIn);
    _curvedAnimation2 = CurvedAnimation(
        parent: _controller2, curve: Curves.fastEaseInToSlowEaseOut);

    _animation1 =
        Tween<double>(begin: 20.0, end: 0.0).animate(_curvedAnimation1);
    _animation2 = Tween<double>(begin: 0.0, end: 90 * (pi / 180))
        .animate(_curvedAnimation2);
  }

  void animate() {
    if (_isAnimation1Complete) {
      _controller2.reverse().then((_) {
        _controller1.reverse();
        _isAnimation1Complete = false;
        notifyListeners();
      });
    } else {
      _controller1.forward().then((_) {
        _isAnimation1Complete = true;
        _controller2.forward();
        notifyListeners();
      });
    }
  }
}
