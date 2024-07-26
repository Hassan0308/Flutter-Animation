import 'package:flutter/material.dart';

class RippleAnimationProvider with ChangeNotifier {
  late AnimationController _controller;
  late Animation<double> _animation;

  void initializeAnimation(TickerProvider vsync) {
    _controller = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        notifyListeners();
      });
  }

  Animation<double> get animation => _animation;
  AnimationController get controller => _controller;

  void startAnimation() {
    _controller.forward(from: 0.0);
  }
}
