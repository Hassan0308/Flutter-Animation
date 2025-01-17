import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class RiveProvider with ChangeNotifier {
  Artboard? mainArtBoard1;
  Artboard? mainArtBoard2;
  SMIInput<bool>? check1;
  SMIInput<bool>? check2;

  loadRiveFiles() {
    rootBundle.load("assets/background.riv").then((rive1) {
      final artboard1 = RiveFile.import(rive1).mainArtboard;
      final controller1 =
          StateMachineController.fromArtboard(artboard1, "State Machine 1");
      if (controller1 != null) {
        artboard1.addController(controller1);
        mainArtBoard1 = artboard1;
        check1 = controller1.findInput("Theme toggled");
      }
    });

    rootBundle.load("assets/toogle.riv").then((rive2) {
      final artboard2 = RiveFile.import(rive2).mainArtboard;
      final controller2 =
          StateMachineController.fromArtboard(artboard2, "State Machine 1");
      if (controller2 != null) {
        artboard2.addController(controller2);
        mainArtBoard2 = artboard2;
        check2 = controller2.findInput("isDark");
      }
    });

    notifyListeners();
  }

  void toggleInputs() {
    if (check1 != null && check2 != null) {
      check1!.value = !check1!.value;
      check2!.value = !check2!.value;
      notifyListeners();
    }
  }
}
