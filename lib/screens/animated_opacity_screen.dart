import 'package:flutter/material.dart';
import 'package:flutter_animation/provider/animated_opacity_provider.dart';
import 'package:provider/provider.dart';

class AnimatedOpacityScreen extends StatelessWidget {
  const AnimatedOpacityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
     var provider =
        Provider.of<AnimatedOpacityProider>(context, listen: false);
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
            Consumer<AnimatedOpacityProider>(
                builder: (context, provider, child) {
              return AnimatedOpacity(
                opacity: provider.flag? 1.0:0.0,
                duration: const Duration(seconds: 2),
                child: const Icon(Icons.apple,color: Colors.black,
                size: 200,),
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
