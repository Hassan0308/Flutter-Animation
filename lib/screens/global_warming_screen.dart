import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animation/provider/info_card_provider.dart';
import 'package:flutter_animation/provider/theme_provider.dart';
import 'package:flutter_animation/screens/info_card_item.dart';
import 'package:flutter_animation/util/color_resources.dart';
import 'package:flutter_animation/util/images.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class GlobalWarmingScreen extends StatefulWidget {
  const GlobalWarmingScreen({super.key});

  @override
  State<GlobalWarmingScreen> createState() => _GlobalWarmingScreenState();
}

class _GlobalWarmingScreenState extends State<GlobalWarmingScreen>
    with TickerProviderStateMixin {
  StateMachineController? _stateMachineController;
  Artboard? mainArtBoard;
  SMIInput<bool>? check;

  StateMachineController? _stateMachineController2;
  Artboard? mainArtBoard2;
  SMIInput<bool>? check2;

  @override
  void initState() {
    rootBundle.load("assets/background.riv").then((rive) {
      var riveFile = RiveFile.import(rive);
      var mArtBoard = riveFile.mainArtboard;
      _stateMachineController =
          StateMachineController.fromArtboard(mArtBoard, "State Machine 1");
      if (_stateMachineController != null) {
        mArtBoard.addController(_stateMachineController!);
        mainArtBoard = mArtBoard;
        check = _stateMachineController!.findInput("Theme toggled");
      }
    });

    rootBundle.load("assets/toogle.riv").then((rive) {
      var riveFile = RiveFile.import(rive);
      var mArtBoard = riveFile.mainArtboard;
      _stateMachineController2 =
          StateMachineController.fromArtboard(mArtBoard, "State Machine 1");
      if (_stateMachineController2 != null) {
        mArtBoard.addController(_stateMachineController2!);
        mainArtBoard2 = mArtBoard;
        check2 = _stateMachineController2!.findInput("isDark");
        check2!.value = !check2!.value;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final infoCardProvider = Provider.of<InfoCardProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          if (mainArtBoard == null)
            const Center(
              child: CircularProgressIndicator(), // Show loading indicator
            )
          else
            Container(
                width: width,
                height: height,
                child: Rive(
                  artboard: mainArtBoard!,
                  fit: BoxFit.cover,
                )),
          Padding(
            padding: EdgeInsets.fromLTRB(
                width * 0.05, height * 0.1, width * 0.05, height * 0.02),
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
                  child: Column(
                    children: [
                      Text(
                        "Global warming is the rapid increase in earth's temperature",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: height * 0.1,
                        width: width * 0.5,
                        color: Colors.transparent,
                        child: GestureDetector(
                          onTap: () {
                            themeProvider.toggleTheme();
                            setState(() {
                              check!.value = !check!.value;
                              check2!.value = !check2!.value;
                            });
                          },
                          child: (mainArtBoard2 == null)
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Rive(
                                  artboard: mainArtBoard2!,
                                  fit: BoxFit.contain,
                                ),
                        ),
                      )
                    ],
                  ),
                ),
                // const SizedBox(height: 16),
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
        ],
      ),
    );
  }
}
