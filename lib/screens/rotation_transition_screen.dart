import 'package:flutter/material.dart';

class RotationTransitionScreen extends StatefulWidget {
  const RotationTransitionScreen({super.key});

  @override
  _RotationTransitionScreenState createState() =>
      _RotationTransitionScreenState();
}

class _RotationTransitionScreenState extends State<RotationTransitionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          "Rotation Transition",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 85, 105, 255),
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTapUp: (details) {
                animationController.repeat();
              },
              onTapDown: (details) {
                animationController.stop();
              },
              child: RotationTransition(
                  turns: animationController,
                  child: Image.asset('assets/images/earth.png')),
            ),
            const SizedBox(height: 20),
            const Text(
              "Tap to pause the globe",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
