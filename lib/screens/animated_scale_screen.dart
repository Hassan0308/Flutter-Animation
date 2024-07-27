import 'package:flutter/material.dart';
import 'package:flutter_animation/provider/animated_scale_provider.dart';
import 'package:provider/provider.dart';

class AnimatedScaleScreen extends StatelessWidget {
  const AnimatedScaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var provider = Provider.of<AnimatedScaleProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Animated Scale"),
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
            Consumer<AnimatedScaleProvider>(
              builder: (context, provider, child) {
                return Center(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: AnimatedScale(
                      scale: provider.isScale ? 1.0 : 3.0,
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeInOut,
                      child: const Icon(
                        Icons.sunny,
                        color: Colors.amberAccent,
                        size: 70,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  provider.scale();
                },
                child: const Text("Click me")),
          ],
        ),
      ),
    );
  }
}
