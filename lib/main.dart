import 'package:flutter/material.dart';
import 'package:flutter_animation/provider/animated_align_provider.dart';
import 'package:flutter_animation/provider/animated_cross_fade_provider.dart';
import 'package:flutter_animation/provider/animated_opacity_provider.dart';
import 'package:flutter_animation/provider/animated_padding_provider.dart';
import 'package:flutter_animation/provider/animated_positioned_provider.dart';
import 'package:flutter_animation/provider/animated_scale_provider.dart';
import 'package:flutter_animation/screens/home_screen.dart';
import 'package:flutter_animation/provider/animated_container_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => AnimatedContainerProider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AnimatedOpacityProider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AnimatedPaddingProider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AnimatedAlignProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AnimatedPositionedProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AnimatedScaleProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AnimatedCrossFadeProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
