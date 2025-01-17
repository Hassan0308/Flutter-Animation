import 'package:flutter/material.dart';
import 'package:flutter_animation/provider/info_card_provider.dart';
import 'package:flutter_animation/screens/info_card_item.dart';
import 'package:flutter_animation/util/images.dart';
import 'package:provider/provider.dart';

class GlobalWarmingScreen extends StatefulWidget {
  const GlobalWarmingScreen({super.key});

  @override
  State<GlobalWarmingScreen> createState() => _GlobalWarmingScreenState();
}

class _GlobalWarmingScreenState extends State<GlobalWarmingScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final infoCardProvider = Provider.of<InfoCardProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xff8FE5FF),
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.02),
        child: Column(
          children: [
            // Top Container
            Container(
              width: width,
              constraints: BoxConstraints(minHeight: height * 0.2),
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: height * 0.02),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(Images
                      .containerBackground), // Replace with actual image path
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  "Global warming is the rapid increase in earth's temperature",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Collapsible Cards
            Expanded(
              child: ListView.builder(
                itemCount: infoCardProvider.infoCards.length,
                itemBuilder: (context, index) {
                  final card = infoCardProvider.infoCards[index];
                  return InfoCardItem(
                    title: card.title,
                    content: card.content,
                    color: card.color,
                    isExpanded: card.isExpanded,
                    onTap: () {
                      infoCardProvider.toggleCard(index);
                    },
                  ); 
                  /*GestureDetector(
                    onTap: () {
                      infoCardProvider.toggleCard(index);  // Toggle the card using the provider
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimatedSize(
                        duration: const Duration(milliseconds: 500), // Controls the size animation
                        curve: Curves.easeInOut,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Card Title
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: card.color, // Dynamic card color
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10),
                                    bottom: Radius.circular(card.isExpanded ? 0 : 10),
                                  ),
                                ),
                                child: Text(
                                  card.title,
                                  style: const TextStyle(color: Colors.white, fontSize: 18),
                                ),
                              ),
                              // Slide-In Animated Content 
                              card.isExpanded
                                  ? Container(
                                      key: ValueKey(card.title),
                                      padding: const EdgeInsets.all(16),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(10),
                                        ),
                                      ),
                                      child: SlideTransition(
                                        position: Tween<Offset>(begin: const Offset(0, -0.5), end: Offset.zero)
                                            .animate(
                                          CurvedAnimation(
                                            parent: AnimationController(
                                              vsync: this, // Use 'this' for the TickerProvider
                                              duration: const Duration(milliseconds: 500),
                                            )..forward(),
                                            curve: Curves.easeOut,
                                          ),
                                        ),
                                        child: Text(
                                          card.content,
                                          style: const TextStyle(fontSize: 16, color: Colors.black),
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                */
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
