import 'package:flutter/material.dart';
import 'package:flutter_animation/provider/animated_padding_provider.dart';
import 'package:provider/provider.dart';

class AnimatedAlignScreen extends StatelessWidget {
  const AnimatedAlignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var provider = Provider.of<AnimatedPaddingProider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Animated Opacity"),
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
            Consumer<AnimatedPaddingProider>(
                builder: (context, provider, child) {
              return AnimatedAlign(
                alignment:provider.flag? Alignment.centerLeft:Alignment.centerRight,
                duration: const Duration(seconds: 2),
                child: const SizedBox(
                  width: 200,
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
                  ),
                ),
              );
            }),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  provider.toggle();
                },
                child: const Text("Click me")),
          ],
        ),
      ),
    );
  }
}
