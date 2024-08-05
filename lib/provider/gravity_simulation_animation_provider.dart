import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class GravitySimulationAnimationProvider extends ChangeNotifier {
  late AnimationController _starController;
  late Animation _starAnimation;
  late List<AnimationController> _gravityControllers;
  late List<GravitySimulation> _gravitySimulations;
  List<bool> _spark = List<bool>.filled(30, false);

  AnimationController get starController => _starController;
  Animation get starAnimation => _starAnimation;
  List<AnimationController> get gravityControllers => _gravityControllers;
  List<GravitySimulation> get gravitySimulations => _gravitySimulations;
  List<bool> get spark => _spark;

  void initilizeAnimation(TickerProvider vsync) {
    _starController = AnimationController(
        vsync: vsync, duration: const Duration(milliseconds: 200));
    _starAnimation = Tween(begin: 0.7, end: 1.0).animate(_starController);
    _starController.repeat();

    _gravityControllers = List.generate(
      30,
      (index) => AnimationController.unbounded(
        vsync: vsync,
      ),
    );

    _gravitySimulations = List.generate(
      30,
      (index) => GravitySimulation(
        20,
        0,
        2000,
        30,
      ),
    );
  }

  void startAnimation(int index) {
    _gravityControllers[index].animateWith(_gravitySimulations[index]);
    _spark[index] = true;
    notifyListeners();
  }

  void resetAllAnimations() {
    for (int i = 0; i < 30; i++) {
      _gravityControllers[i].reset();
      _gravityControllers[i].value = 0;
    }
    _spark = List<bool>.filled(30, false);
    notifyListeners();
  }

  @override
  void dispose() {
    _starController.dispose();
    for (var controller in _gravityControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
