import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  void init(TickerProvider vsync) {
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: vsync,
    )..repeat();

    final tweenSequence = TweenSequence<Color?>([
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.red, end: Colors.blue)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.blue, end: Colors.purple)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.purple, end: Colors.green)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.green, end: Colors.red)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 1.0,
      ),
    ]);

    _colorAnimation = tweenSequence.animate(_controller);
  }

  Animation<Color?> get colorAnimation => _colorAnimation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
