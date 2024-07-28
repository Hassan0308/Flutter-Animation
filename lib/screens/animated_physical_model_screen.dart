import 'package:flutter/material.dart';
import 'package:flutter_animation/provider/animated_physical_model_provider.dart';
import 'package:provider/provider.dart';

class AnimatedPhysicalModelScreen extends StatelessWidget {
  const AnimatedPhysicalModelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text("Animated Physical Model"),
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Consumer<AnimatedPhysicalModelProvider>(
            builder: (context, provider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: AnimatedPhysicalModel(
                      duration: const Duration(seconds: 1),
                      shape: BoxShape.rectangle,
                      elevation: provider.isElevated ? 10 : 0,
                      color: Colors.cyan,
                      shadowColor: Colors.black,
                      borderRadius: provider.isElevated
                          ? BorderRadius.circular(20)
                          : BorderRadius.circular(0),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            provider.isElevated ? "Elevated" : "Flat",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      provider.toggleElevation();
                    },
                    child: const Text('Toggle Elevation'),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
