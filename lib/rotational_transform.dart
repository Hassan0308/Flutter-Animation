import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/rotational_transform_provider.dart';

class RotationalTransformScreen extends StatefulWidget {
  const RotationalTransformScreen({super.key});

  @override
  State<RotationalTransformScreen> createState() =>
      _RotationalTransformScreenState();
}

class _RotationalTransformScreenState extends State<RotationalTransformScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<RotationalTransformProvider>(context, listen: false)
          .initializeAnimation(this);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var provider = Provider.of<RotationalTransformProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B3142),
        title: const Text("Rotational Transform Animations"),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width * 0.7,
              height: width * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF0B3142),
                  width: width * 0.02,
                ),
              ),
              child: Center(
                child: Stack(
                  children: [
                    AnimatedBuilder(
                      animation: provider.animation,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: provider.animation.value * pi / 180,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: width * 0.07,
                                height: width * 0.07,
                                decoration: const BoxDecoration(
                                  color: Colors.amber,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(
                                width: width * 0.07,
                              ),
                              Container(
                                width: width * 0.07,
                                height: width * 0.07,
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(
                                width: width * 0.07,
                              ),
                              Container(
                                width: width * 0.07,
                                height: width * 0.07,
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: provider.animation,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: (360 - provider.animation.value) * pi / 180,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: width * 0.07,
                              ),
                              Container(
                                width: width * 0.07,
                                height: width * 0.07,
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(
                                width: width * 0.07,
                              ),
                              Container(
                                width: width * 0.07,
                                height: width * 0.07,
                                decoration: const BoxDecoration(
                                  color: Colors.deepOrange,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(
                                width: width * 0.07,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<RotationalTransformProvider>(
              builder: (context, pro, child) {
                return Slider(
                  value: pro.speed,
                  min: 1.0,
                  max: 5.0,
                  activeColor: const Color(0xFF0B3142),
                  label: pro.speed.round().toString(),
                  onChanged: (value) {
                    pro.changeSpeed(value);
                  },
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Fast",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    "Slow",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<RotationalTransformProvider>(
              builder: (context, pro, child) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0B3142),
                    foregroundColor: Colors.white,
                    fixedSize: Size(width * 0.3, height * 0.05),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    provider.toogleAnimation();
                  },
                  child: Text(provider.isAnimating ? "Stop" : "Start"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
