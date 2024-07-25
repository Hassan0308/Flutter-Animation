// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(      backgroundColor: Color.fromARGB(255, 159, 233, 238),
centerTitle: true, title: Text("Detail")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Hero(
              tag: "hero-animation",
              child: Image.asset(
                "assets/images/image1.jpg",
                width: width,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "The polar wolf, also known as the Arctic wolf (Canis lupus arctos), is a subspecies of the gray wolf native to the Arctic regions of North America, specifically found in the Canadian Arctic Archipelago. These wolves are well-adapted to the harsh, frigid environments they inhabit.\nAppearance: Polar wolves have a striking white or light gray coat that helps them blend into the snowy landscape, providing excellent camouflage. Their fur is thick and insulating, protecting them from extreme cold temperatures that can drop as low as -50 degrees Celsius (-58 degrees Fahrenheit).\nSize: They are generally smaller than their southern counterparts, with males typically weighing between 85 to 99 pounds (38 to 45 kg) and females slightly lighter. They measure about 3 to 5 feet (0.9 to 1.5 meters) in length, including their tail."),
          )
        ],
      ),
    );
  }
}
