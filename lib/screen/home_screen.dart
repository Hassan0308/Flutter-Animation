import 'package:flutter/material.dart';
import 'package:flutter_animation/card/flip_card.dart';
import 'package:flutter_animation/provider/flip_card_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cards = [
    {"imagePath": "assets/images/card1.jpeg", "id": 1},
    {"imagePath": "assets/images/card2.jpeg", "id": 2},
    {"imagePath": "assets/images/card3.jpeg", "id": 3},
    {"imagePath": "assets/images/card4.jpeg", "id": 4},
    {"imagePath": "assets/images/card1.jpeg", "id": 1},
    {"imagePath": "assets/images/card2.jpeg", "id": 2},
    {"imagePath": "assets/images/card3.jpeg", "id": 3},
    {"imagePath": "assets/images/card4.jpeg", "id": 4},
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/background.jpeg",
              ),
              fit: BoxFit.cover),
        ),
        child: Consumer<FlipCardProvider>(
          builder: (context, flipCardProvider, child) {
            return Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (flipCardProvider.isTimmer)
                      Text(
                        "Time Left: ${flipCardProvider.timerSeconds} seconds",
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    else
                      ElevatedButton(
                        onPressed: () {
                          flipCardProvider.triggerTimmer();
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.red,
                          shadowColor: Colors.blueGrey,
                          elevation: 10,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "START",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: cards.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FlipCard(
                                frontImagePath: cards[index]['imagePath'],
                                index: index,
                                id: cards[index]['id'],
                                backImagePath: "assets/images/front_image.png",
                                isFlipped: flipCardProvider.flippedIndexes
                                    .contains(index),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                if (flipCardProvider.celebration)
                  Container(
                    color: Colors.black.withOpacity(0.6),
                    height: height,
                    width: width,
                  ),
                if (flipCardProvider.celebration)
                  Center(
                    child: Lottie.asset(
                      'assets/animations/celebration.json',
                      repeat: false,
                    ),
                  ),
                if (flipCardProvider.celebration)
                  Positioned.fill(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/animations/win3.json',
                          repeat: false,
                        ),
                        Lottie.asset(
                          'assets/animations/win2.json',
                          repeat: false,
                        ),
                        const SizedBox(height: 20), // Spacing
                        ElevatedButton(
                          onPressed: () {
                            // Reset the game when the button is pressed
                            flipCardProvider.resetCelebration();
                            flipCardProvider.resetGame();
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                          ),
                          child: const Text(
                            "Continue",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (flipCardProvider.isLose)
                  Container(
                    color: Colors.black.withOpacity(0.6),
                    height: height,
                    width: width,
                  ),
                if (flipCardProvider.isLose)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/animations/lose.json',
                        repeat: false,
                      ),
                      const Text(
                        "You Lose",
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 60,
                            fontWeight: FontWeight.w900),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          flipCardProvider.resetGame();
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        child: const Text(
                          "Try Again",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
