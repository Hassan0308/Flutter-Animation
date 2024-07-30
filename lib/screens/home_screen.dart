import 'package:flutter/material.dart';
import 'package:flutter_animation/screens/matrix4_transformation1_screen.dart';
import 'package:flutter_animation/screens/matrix4_transformation2_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> transformAnimations = [
      {
        'animation': 'Interactive Rotation Demo',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Matrix4Transformation1Screen(),
            ),
          );
        },
        'image': 'assets/images/3D.png',
      },
      {
        'animation': 'Combined Rotation & Transformation Demo',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Matrix4Transformation2Screen(),
            ),
          );
        },
        'image': 'assets/images/transform.png',
      },
    ];

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: const Text("Matrix4 Transformation"),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: transformAnimations.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: transformAnimations[index]['onTap'],
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: height * 0.4,
                      width: width * 0.9,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 161, 175, 255),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            transformAnimations[index]['image'],
                            height: height * 0.2,
                            width: width * 0.6,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            transformAnimations[index]['animation'].toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
