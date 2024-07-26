import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animation/provider/ripple_animation_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Provider.of<RippleAnimationProvider>(context, listen: false)
        .initializeAnimation(this);
  }

  List<double> radiusList = [100, 130, 160, 190, 220, 250];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 7, 112, 107),
        title: const Text(
          "Ripple Animation",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer<RippleAnimationProvider>(
          builder: (context, provider, child) {
            return AnimatedBuilder(
              animation: provider.controller,
              builder: (context, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    ...radiusList.map((radius) {
                      return Container(
                        width: radius * provider.animation.value,
                        height: radius * provider.animation.value,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color.fromARGB(255, 7, 112, 107)
                              .withOpacity(
                            1 - provider.animation.value,
                          ),
                        ),
                      );
                    }).toList(),
                    GestureDetector(
                      onTap: () {
                        Provider.of<RippleAnimationProvider>(context,
                                listen: false)
                            .startAnimation();
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 7, 112, 107),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            "Tap me",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
