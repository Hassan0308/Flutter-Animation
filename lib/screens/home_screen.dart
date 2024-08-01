import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late SpringSimulation simulation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController.unbounded(vsync: this,value: 100)..addListener(() {});

  //  _restartAnimation();
  }

  void _restartAnimation() {
    simulation = SpringSimulation(
      const SpringDescription(
        mass: 1,
        stiffness: 50,
        damping: 0.5,
      ),
      0, // Starting point
      100, // Ending point
      70, // Initial velocity
    );

    controller.animateWith(simulation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 23, 124, 155),
        title: const Text("Spring Simulation"),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: width,
        height: height,
        color: const Color.fromARGB(255, 188, 219, 245),
        padding: const EdgeInsets.fromLTRB(0, 50, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Center(
                child: Text(
              "Tap on the Ball to Bounce",
              style: TextStyle(fontSize: 18, color: Colors.black),
              textAlign: TextAlign.center,
            )),
            SizedBox(
              height: height * 0.1,
            ),
            Container(
              height: height * 0.02,
              width: width * 0.6,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFD2B48C),
                    Color.fromARGB(255, 168, 115, 91),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.2, 2],
                ),
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    topRight: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.5,
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Stack(
                    children: [
                      Transform.translate(
                        offset: Offset(0, controller.value),
                        child: GestureDetector(
                          onTap: () {
                            controller.stop();
                            controller.value = 0;
                            _restartAnimation();
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            margin: EdgeInsets.only(
                              left: width * 0.42,
                            ),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 255, 0, 0),
                                  Color.fromARGB(255, 252, 164, 164),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.2, 2],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 2,
                        margin: EdgeInsets.only(
                          left: width * 0.55,
                        ),
                        height: controller.value,
                        color: Colors.white,
                      ),
                    ],
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
