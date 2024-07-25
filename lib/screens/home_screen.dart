// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_animation/screens/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 159, 233, 238),
          centerTitle: true,
          title: Text("Hero Animation")),
      body: SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => DetailScreen())));
                },
                child: Hero(
                    tag: "hero-animation",
                    child: Image.asset(
                      "assets/images/image1.jpg",
                      height: 100,
                      width: 100,
                    ))),
            Text(
              "Tap on Image To View Details",
              style: TextStyle(fontSize: 20, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
