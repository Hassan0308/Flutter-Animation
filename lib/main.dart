import 'package:flutter/material.dart';
import 'package:flutter_animation/provider/info_card_provider.dart';
import 'package:flutter_animation/screens/global_warming_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InfoCardProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Global Warming",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: GlobalWarmingScreen(),
    );
  }
}
