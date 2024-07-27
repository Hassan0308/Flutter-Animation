import 'package:flutter/material.dart';
import 'package:flutter_animation/provider/animated_positioned_provider.dart';
import 'package:provider/provider.dart';

class AnimatedPositionedScreen extends StatelessWidget {
  const AnimatedPositionedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Animated Positioned"),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: SizedBox(
        width: width,
        child: Consumer<AnimatedPositionedProvider>(
            builder: (context, provider, child) {
          return Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                top: provider.ismove ? 200 : 0,
                left: provider.ismove ? 200 : 0,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber,
                  ),
                  
                ),
              ),
              Positioned(
                bottom: 30,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      provider.move();
                    },
                    child: Text(provider.ismove ? 'Move Back' : 'Move'),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
