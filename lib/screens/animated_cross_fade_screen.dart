import 'package:flutter/material.dart';
import 'package:flutter_animation/provider/animated_cross_fade_provider.dart';
import 'package:provider/provider.dart';

class AnimatedCrossFadeScreen extends StatelessWidget {
  const AnimatedCrossFadeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var provider =
        Provider.of<AnimatedCrossFadeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Animated Cross Fade"),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<AnimatedCrossFadeProvider>(
                builder: (context, provider, child) {
              return AnimatedCrossFade(
                firstChild: Image.asset(
                  'assets/images/image1.png',
                  width: 200,
                  height: 200,
                ),
                secondChild: Image.asset('assets/images/image2.png',
                    width: 200, height: 200),
                crossFadeState: provider.fade
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(seconds: 2),
              );
            }),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  provider.toggleFade();
                },
                child: const Text("Click me")),
          ],
        ),
      ),
    );
  }
}
