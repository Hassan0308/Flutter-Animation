import 'package:flutter/material.dart';

class FadeAndSlideTransitionScreen extends StatefulWidget {
  const FadeAndSlideTransitionScreen({super.key});

  @override
  _FadeAndSlideTransitionScreenState createState() =>
      _FadeAndSlideTransitionScreenState();
}

class _FadeAndSlideTransitionScreenState
    extends State<FadeAndSlideTransitionScreen>
    with SingleTickerProviderStateMixin {
  
  late AnimationController animationController;
  late Animation<double> animation1;
  late Animation<Offset> animation2;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation1 = Tween(begin: 0.0, end: 1.0).animate(animationController);
    animation2 = Tween(
      begin: const Offset(0.0, -1.5),
      end: const Offset(0.0, 0.0),
    ).animate(animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          "Fade and Slide Transition",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF000f89),
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeTransition(
                opacity: animation1,
                child: SlideTransition(
                  position: animation2,
                  child: const Icon(
                    Icons.rocket,
                    color: Colors.blueGrey,
                    size: 200,
                  ),
                )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (animationController.isCompleted) {
                  animationController.reverse();
                } else {
                  animationController.forward();
                }
              },
              child: const Text("Tap Here"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
