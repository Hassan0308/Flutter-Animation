import 'package:flutter/material.dart';
import 'package:flutter_animation/provider/info_card_provider.dart';
import 'package:flutter_animation/provider/rive_provider.dart';
import 'package:flutter_animation/provider/theme_provider.dart';
import 'package:flutter_animation/screens/global_warming_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InfoCardProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => RiveProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: "Global Warming",
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: GlobalWarmingScreen(),
    );
  }
}
