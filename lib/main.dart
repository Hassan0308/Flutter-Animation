import 'package:flutter/material.dart';
import 'package:flutter_animation/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Hero Animation",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
