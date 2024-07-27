import 'package:flutter/material.dart';
import 'package:flutter_animation/provider/animated_opacity_provider.dart';
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
  ], child: MyApp()));
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
