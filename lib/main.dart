import 'package:flutter/material.dart';
import 'package:flutter_animation/provider/flip_card_provider.dart';
import 'package:flutter_animation/screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => FlipCardProvider(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Flip Animation',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
