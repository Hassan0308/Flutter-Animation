// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_animation/provider/animated_container_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var provider =
        Provider.of<AnimatedContainerProider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Animated Container"),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<AnimatedContainerProider>(
                builder: (context, provider, child) {
              return AnimatedContainer(
                decoration: BoxDecoration(
                  borderRadius: provider.flag
                      ? BorderRadius.circular(0)
                      : BorderRadius.circular(20),
                  color: provider.flag ? Colors.blue : Colors.orange,
                ),
                duration: Duration(seconds: 2),
                height: provider.flag ? 100 : 200,
                width: provider.flag ? 200 : 100,
              );
            }),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  provider.toggleContainer();
                },
                child: Text("Click me")),
          ],
        ),
      ),
    );
  }
}
