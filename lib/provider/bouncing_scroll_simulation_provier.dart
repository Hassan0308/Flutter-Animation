import 'package:flutter/material.dart';

class BouncingScrollSimulationProvider with ChangeNotifier {
  double _position = 0.0;
  double _velocity = 0.0;
  late AnimationController _controller;
  late ScrollController _scrollController;

  void initializeController(
      TickerProvider vsync, ScrollController scrollController) {
    _scrollController = scrollController;
    _controller = AnimationController.unbounded(vsync: vsync)
      ..addListener(() {
        _position = _controller.value;
        _scrollController.jumpTo(_position);
        notifyListeners();
      });
  }

  void startBounceSimulation() {
    final simulation = BouncingScrollSimulation(
      position: _scrollController.position.pixels,
      velocity: _velocity,
      leadingExtent: 0.0,
      trailingExtent: _scrollController.position.maxScrollExtent,
      spring: const SpringDescription(
        mass: 1.0,
        stiffness: 100.0,
        damping: 2,
      ),
    );
    _controller.animateWith(simulation);
  }

  void onPanEnd(DragEndDetails details) {
    _velocity = details.velocity.pixelsPerSecond.dy;
    startBounceSimulation();
  }

  void onPanUpdate(DragUpdateDetails details) {
    _scrollController
        .jumpTo(_scrollController.position.pixels - details.delta.dy);
  }
}
