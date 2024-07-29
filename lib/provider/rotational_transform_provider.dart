import 'package:flutter/material.dart';

class RotationalTransformProvider with ChangeNotifier {
  late Animation<double> _animation;
  late AnimationController _animationController;

  bool _isAnimating = false;

  double _speed = 1;

  Animation<double> get animation => _animation;
  AnimationController get animationController => _animationController;

  double get speed => _speed;

  bool get isAnimating => _isAnimating;

  void changeSpeed(double value) {
    _speed = value;
    _animationController.duration = Duration(seconds: _speed.round());
    _animationController.repeat();
    notifyListeners();
  }

  void initializeAnimation(TickerProvider ticker) {
    _animationController = AnimationController(
      vsync: ticker,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween(begin: 0.0, end: 360.0).animate(_animationController);
    notifyListeners();
  }

  void toogleAnimation() {
    if (_isAnimating) {
      _animationController.stop();
      _isAnimating = false;
    } else {
      _animationController.repeat();
      _isAnimating = true;
    }
    notifyListeners();
  }
}
