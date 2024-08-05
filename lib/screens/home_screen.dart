import 'package:flutter/material.dart';
import 'package:flutter_animation/provider/gravity_simulation_animation_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Provider.of<GravitySimulationAnimationProvider>(context, listen: false)
        .initilizeAnimation(this);
  }

  @override
  void dispose() {
    Provider.of<GravitySimulationAnimationProvider>(context, listen: false)
        .dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 16, 4, 68),
        title: const Text("Tap on stars to break them"),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        centerTitle: true,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              Provider.of<GravitySimulationAnimationProvider>(context,
                      listen: false)
                  .resetAllAnimations();
            },
          ),
        ],
      ),
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0A0F2B), Color.fromARGB(255, 23, 11, 73)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Stack(
          children: [
            Positioned(
                top: 20,
                left: 0,
                right: 0,
                child: Opacity(
                    opacity: 0.5,
                    child: Image.asset(
                      'assets/images/image.png',
                      height: 150,
                      width: 150,
                    ))),
            Consumer<GravitySimulationAnimationProvider>(
                builder: (context, provider, child) {
              return AnimatedBuilder(
                  animation: Listenable.merge([
                    provider.starController,
                    ...provider.gravityControllers
                  ]),
                  builder: (context, child) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 20,
                      ),
                      itemCount: 30,
                      itemBuilder: (context, index) {
                        return Transform.translate(
                          offset: Offset(
                              0, provider.gravityControllers[index].value),
                          child: GestureDetector(
                            onTap: () {
                              provider.startAnimation(index);
                            },
                            child: Stack(
                              children: [
                                Visibility(
                                  visible: provider.spark[index],
                                  child: Image.asset(
                                    'assets/images/flame.png',
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                                Visibility(
                                  visible: !provider.spark[index],
                                  child: Icon(
                                    (index % 2 == 0)
                                        ? Icons.star
                                        : Icons.star_outline,
                                    size: 20,
                                    color:
                                        const Color.fromARGB(255, 255, 208, 0)
                                            .withOpacity(
                                                provider.starAnimation.value),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  });
            }),
          ],
        ),
      ),
    );
  }
}
