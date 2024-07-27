import 'package:flutter/material.dart';
import 'package:flutter_animation/screens/animated_align_screen.dart';
import 'package:flutter_animation/screens/animated_container_screen.dart';
import 'package:flutter_animation/screens/animated_opacity_screen.dart';
import 'package:flutter_animation/screens/animated_padding_screen.dart';
import 'package:flutter_animation/screens/animated_positioned_screen.dart';
import 'package:flutter_animation/screens/animated_scale_screen.dart';

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
                builder: (context) => const AnimatedContainerScreen()),
          );
        },
      },
      {
        'animation': 'Animated Opacity',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AnimatedOpacityScreen()),
          );
        },
      },
       {
    'animation': 'Animated Padding',
    'onTap': () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AnimatedPaddingScreen()),
      );
    },
  },
  {
    'animation': 'Animated Align',
    'onTap': () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AnimatedAlignScreen()),
      );
    },
  },
 {
    'animation': 'Animated Positioned',
    'onTap': () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AnimatedPositionedScreen()),
      );
    },
  },
  {
    'animation': 'Animated Scale',
    'onTap': () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AnimatedScaleScreen()),
      );
    },
  },
  /*{
    'animation': 'AnimatedCrossFade',
    'onTap': (BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AnimatedCrossFadeScreen()),
      );
    },
  },
  {
    'animation': 'AnimatedSwitcher',
    'onTap': (BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AnimatedSwitcherScreen()),
      );
    },
  },
  {
    'animation': 'AnimatedPhysicalModel',
    'onTap': (BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AnimatedPhysicalModelScreen()),
      );
    },
  },*/
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
      body: SizedBox(
          width: width,
          child: ListView.builder(
              itemCount: animations.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 233, 177, 243)
                          .withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      textColor: Colors.black,
                      title: Text(animations[index]['animation'].toString()),
                      onTap: animations[index]['onTap'],
                    ),
                  ),
                );
              })),
    );
  }
}
