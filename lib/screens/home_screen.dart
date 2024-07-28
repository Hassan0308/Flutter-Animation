import 'package:flutter/material.dart';
import 'package:flutter_animation/screens/animated_align_screen.dart';
import 'package:flutter_animation/screens/animated_container_screen.dart';
import 'package:flutter_animation/screens/animated_cross_fade_screen.dart';
import 'package:flutter_animation/screens/animated_opacity_screen.dart';
import 'package:flutter_animation/screens/animated_padding_screen.dart';
import 'package:flutter_animation/screens/animated_physical_model_screen.dart';
import 'package:flutter_animation/screens/animated_positioned_screen.dart';
import 'package:flutter_animation/screens/animated_scale_screen.dart';
import 'package:flutter_animation/screens/animated_switcher_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> animations = [
      {
        'animation': 'Animated Container',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AnimatedContainerScreen(),
            ),
          );
        },
        'image': 'assets/images/container.png',
      },
      {
        'animation': 'Animated Opacity',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AnimatedOpacityScreen(),
            ),
          );
        },
        'image': 'assets/images/opacity.png',
      },
      {
        'animation': 'Animated Padding',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AnimatedPaddingScreen(),
            ),
          );
        },
        'image': 'assets/images/padding.png',
      },
      {
        'animation': 'Animated Align',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AnimatedAlignScreen(),
            ),
          );
        },
        'image': 'assets/images/align.png',
      },
      {
        'animation': 'Animated Positioned',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AnimatedPositionedScreen(),
            ),
          );
        },
        'image': 'assets/images/position.png',
      },
      {
        'animation': 'Animated Scale',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AnimatedScaleScreen(),
            ),
          );
        },
        'image': 'assets/images/scale.png',
      },
      {
        'animation': 'Animated CrossFade',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AnimatedCrossFadeScreen(),
            ),
          );
        },
        'image': 'assets/images/cross_fade.png',
      },
      {
        'animation': 'Animated Switcher',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AnimatedSwitcherScreen(),
            ),
          );
        },
        'image': 'assets/images/switcher.png',
      },
      {
        'animation': 'Animated Physical Model',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AnimatedPhysicalModelScreen(),
            ),
          );
        },
        'image': 'assets/images/physical_model.png',
      },
    ];
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Implicit Animations"),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          width: width,
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: animations
                .map((e) => GestureDetector(
                      onTap: e['onTap'],
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 233, 177, 243)
                              .withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(e['image'], width: 50, height: 50),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              e['animation'].toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          )),
    );
  }
}
