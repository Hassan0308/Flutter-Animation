import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'rotational_transform.dart';
import 'provider/rotational_transform_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RotationalTransformProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RotationalTransformScreen(),
    );
  }
}
