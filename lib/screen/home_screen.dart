import 'package:flutter/material.dart';
import 'package:flutter_animation/card/flip_card.dart';
import 'package:flutter_animation/provider/flip_card_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  List<String> image = [
    "assets/images/card1.jpeg",
    "assets/images/card2.jpeg",
    "assets/images/card3.jpeg",
    "assets/images/card4.jpeg",
    "assets/images/card5.jpeg",
    "assets/images/card6.jpeg",
    "assets/images/card7.jpeg",
    "assets/images/card8.jpeg",
    "assets/images/card9.jpeg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/background.jpeg",
              ),
              fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FlipCard(
                        frontImagePath: 'assets/images/front_image.png',
                        backImagePath: image[index],
                      ),
                    );
                  },
                ),
              ),
            ),
            Consumer<FlipCardProvider>(
              builder: (context, flipCardProvider, child) {
                if (flipCardProvider.celebration) {
                  return Positioned.fill(
                    child: Center(
                      child: Lottie.asset(
                        'assets/animations/celebration.json',
                        repeat: false,
                        onLoaded: (composition) {
                          Future.delayed(composition.duration, () {
                            flipCardProvider.resetCelebration();
                          });
                        },
                      ),
                    ),
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
