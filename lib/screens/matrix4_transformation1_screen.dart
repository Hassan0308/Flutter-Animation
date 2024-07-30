import 'package:flutter/material.dart';
import 'package:flutter_animation/provider/matrix4_transformation1_provider.dart';
import 'package:provider/provider.dart';

class Matrix4Transformation1Screen extends StatefulWidget {
  const Matrix4Transformation1Screen({super.key});

  @override
  State<Matrix4Transformation1Screen> createState() =>
      _Matrix4Transformation1ScreenState();
}

class _Matrix4Transformation1ScreenState
    extends State<Matrix4Transformation1Screen> {
  @override
  Widget build(BuildContext context) {
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "To perform the transformation, simply drag your finger on the square to rotate the square ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 50,
            ),
            Consumer<Matrix4Transformation1Provider>(
                builder: (context, provider, child) {
              return Transform(
                transform: Matrix4.identity()
                  ..rotateX(provider.x)
                  ..rotateY(provider.y)
                  ..rotateZ(provider.z),
                alignment: FractionalOffset.center,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    provider.rotate(provider.x + details.delta.dy / 100,
                        provider.y + details.delta.dx / 100);
                  },
                  child: Container(
                    color: Colors.indigoAccent,
                    height: 200.0,
                    width: 200.0,
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
