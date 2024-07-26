import 'package:flutter/material.dart';
import 'package:flutter_animation/provider/animated_list_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height = 0;
  double width = 0;

  List<Map<String, dynamic>> listItems = [
    {'text': 'Flag', 'icon': Icons.flag},
    {'text': 'Notification', 'icon': Icons.notifications},
    {'text': 'Cloud', 'icon': Icons.cloud},
    {'text': 'Nightlight', 'icon': Icons.nightlight_round},
    {'text': 'Assignment', 'icon': Icons.assignment},
    {'text': 'Location', 'icon': Icons.location_pin},
    {'text': 'Settings', 'icon': Icons.settings},
    {'text': 'Rocket', 'icon': Icons.rocket},
    {'text': 'Backpack', 'icon': Icons.backpack},
    {'text': 'Person', 'icon': Icons.person},
    {'text': 'Done All', 'icon': Icons.done_all},
    {'text': 'Search', 'icon': Icons.search},
    {'text': 'Extension', 'icon': Icons.extension},
    {'text': 'Bluetooth', 'icon': Icons.bluetooth},
    {'text': 'Favorite', 'icon': Icons.favorite},
    {'text': 'Lock', 'icon': Icons.lock},
    {'text': 'Bookmark', 'icon': Icons.bookmark},
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AnimatedListProvider>(context, listen: false).startAnimation();
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 26, 51, 167),
        title: const Text(
          "Animated List",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: listItems.length,
              itemBuilder: (context, index) {
                return item(index);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget item(int index) {
    return AnimatedContainer(
      height: 55,
      width: width,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (index * 200)),
      transform: Matrix4.translationValues(
          Provider.of<AnimatedListProvider>(context).isStartAnimation ? 0 : width, 0, 0),
      margin: const EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(horizontal: width / 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 210, 213, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${index + 1}. ${listItems[index]['text']}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(
            listItems[index]['icon'],
          ),
        ],
      ),
    );
  }
}