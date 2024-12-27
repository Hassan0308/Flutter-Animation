import 'package:flutter/material.dart';
import 'package:flutter_animation/gradient_card.dart';
import 'package:scrumlab_flutter_tindercard/scrumlab_flutter_tindercard.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SwipCardAnimation(),
    );
  }
}

class SwipCardAnimation extends StatefulWidget {
  const SwipCardAnimation({super.key});

  @override
  State<SwipCardAnimation> createState() => _SwipCardAnimationState();
}

class _SwipCardAnimationState extends State<SwipCardAnimation>
    with TickerProviderStateMixin {
  // Colors and gradients for reusable styling
  final Color backgroundColor = const Color.fromARGB(255, 96, 15, 109);
  final List<Widget> cards = _generateCards();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          _buildDecorativeImages(width, height),
          _finalScreen(),
          _buildCardStack(width, height),
        ],
      ),
    );
  }

  Widget _finalScreen() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          Image.asset(
            "assets/logo.png",
            width: 200,
            height: 200,
          ),
          GestureDetector(
            onTap: () async {
              var url = Uri.parse("https://pwhservices.tech");
              if (await canLaunchUrl(url)) {
                await launchUrl(
                  url,
                  mode: LaunchMode
                      .externalApplication, // Ensure it opens in an external browser
                );
              } else {
                print("Could not launch $url");
              }
            },
            child: Text(
              "www.pwhservices.tech",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Best wishes for the year ahead",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 255, 255, 255),
              shadows: [
                BoxShadow(
                  color: Colors.purpleAccent.withOpacity(0.6), // Outer glow
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
                BoxShadow(
                  color: Colors.purpleAccent.withOpacity(0.4), // Inner glow
                  blurRadius: 40,
                  spreadRadius: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Method to generate the list of cards
  static List<Widget> _generateCards() {
    return [
      const MainCard(),
      const GradientCard(
        quote:
            "Every new year is a blank canvas, waiting for you to create a masterpiece.🌟 Set your goals, dream big, and achieve greatness.",
        gradientColors: [
          Color.fromRGBO(112, 246, 255, 0.33),
          Color.fromRGBO(221, 108, 241, 0.26),
          Color.fromRGBO(229, 106, 253, 0.71),
          Color.fromRGBO(123, 183, 253, 1),
        ],
        backgroundImage: "assets/card1_bg.png",
        quoteColor: Colors.purple,
      ),
      const GradientCard(
        quote:
            "This year, let us strive to be the architects of our own destiny. With vision, hard work, and perseverance, we can turn our dreams into reality 🌟",
        gradientColors: [
          Color.fromRGBO(252, 37, 103, 1),
          Color.fromRGBO(250, 38, 151, 1),
          Color.fromRGBO(186, 8, 181, 1),
        ],
        backgroundImage: "assets/card1_bg.png",
        quoteColor: Color.fromARGB(255, 236, 184, 245),
      ),
      const GradientCard(
        quote:
            "Embrace the magic of new beginnings. The New Year is a blank canvas; paint it with your dreams, aspirations, and unwavering belief in yourself. 🎨",
        gradientColors: [
          Color.fromRGBO(226, 66, 249, 0.94),
          Color.fromRGBO(79, 147, 249, 1),
        ],
        backgroundImage: "assets/card1_bg.png",
        quoteColor: Color.fromARGB(255, 186, 228, 255),
      ),
      const GradientCard(
        quote:
            "As the New Year unfolds, remember that you have the power to shape your destiny. Take charge and make this year your best yet ✨",
        gradientColors: [
          Color.fromRGBO(245, 116, 185, 1),
          Color.fromRGBO(89, 97, 223, 1),
        ],
        backgroundImage: "assets/card1_bg.png",
        quoteColor: Color.fromARGB(255, 255, 206, 177),
      ),
      const GradientCard(
        quote:
            "This year, let’s prioritize self-care and personal growth. A fulfilled life is built on nurturing our passions and embracing our true selves. ❤",
        gradientColors: [
          Color.fromRGBO(254, 122, 152, 0.81),
          Color.fromRGBO(255, 206, 134, 1),
          Color.fromRGBO(172, 253, 163, 0.64),
        ],
        backgroundImage: "assets/card1_bg.png",
        quoteColor: Colors.purple,
      ),
    ];
  }

  // Method to build the decorative images in the background
  Widget _buildDecorativeImages(double width, double height) {
    return Stack(
      children: [
        Positioned(
          right: -15,
          child: Image.asset(
            "assets/top_right.png",
            width: width * 0.5,
            height: height * 0.3,
          ),
        ),
        Positioned(
          left: -15,
          top: -10,
          child: Image.asset(
            "assets/top_left.png",
            width: width * 0.5,
            height: height * 0.3,
          ),
        ),
      ],
    );
  }

  // Method to build the card stack
  Widget _buildCardStack(double width, double height) {
    return Column(
      children: [
        SizedBox(height: height * 0.2),
        SizedBox(
          height: height * 0.6,
          child: TinderSwapCard(
            swipeUp: true,
            swipeDown: true,
            orientation: AmassOrientation.bottom,
            totalNum: cards.length,
            stackNum: 4,
            swipeEdge: 4.0,
            maxWidth: width * 0.9,
            maxHeight: width,
            minWidth: width * 0.8,
            minHeight: width * 0.8,
            cardBuilder: (context, index) => cards[index],
            cardController: CardController(),
            swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
              if (align.x < 0) {
                print("Swiping Left");
              } else if (align.x > 0) {
                print("Swiping Right");
              }
            },
            swipeCompleteCallback:
                (CardSwipeOrientation orientation, int index) {
              print("Card $index swiped $orientation");
            },
          ),
        ),
      ],
    );
  }
}
