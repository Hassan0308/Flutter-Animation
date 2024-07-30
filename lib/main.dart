import 'package:flutter/material.dart';
import 'package:flutter_animation/provider/matrix4_transformation1_provider.dart';
import 'package:flutter_animation/provider/matrix4_transformation2_provider.dart';
import 'package:flutter_animation/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => Matrix4Transformation1Provider(),
    ),
    ChangeNotifierProvider(
      create: (context) => Matrix4Transformation2Provider(),
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
