import 'package:flutter/material.dart';
import 'package:flutter_animation/cartoon_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xfffa787a),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Scrollable3DList(),
        ),
      ),
    );
  }
}

class Scrollable3DList extends StatelessWidget {
  const Scrollable3DList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView.useDelegate(
      itemExtent: 300,
      diameterRatio: 2, // 3D effect
      physics: const BouncingScrollPhysics(),
      childDelegate: ListWheelChildBuilderDelegate(
        builder: (context, index) => ScrollItem(index: index),
        childCount: 10,
      ),
    );
  }
}

class ScrollItem extends StatefulWidget {
  final int index;

  const ScrollItem({Key? key, required this.index}) : super(key: key);

  @override
  _ScrollItemState createState() => _ScrollItemState();
}

class _ScrollItemState extends State<ScrollItem> {
  double _opacity = 0.0;
  double _scale = 0.5;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100 * widget.index), () {
      setState(() {
        _opacity = 1.0;
        _scale = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartoon = _cartoons[widget.index];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CartoonDetailScreen(cartoon: cartoon),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 250,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAnimatedName(cartoon["name"]!),
              const SizedBox(height: 20),
              _buildDescriptionAndImage(cartoon, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedName(String name) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 1000),
      opacity: _opacity,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 1000),
        scale: _scale,
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                  blurRadius: 10, color: Colors.purple, offset: Offset(2, 2)),
              Shadow(
                  blurRadius: 10,
                  color: Colors.pinkAccent,
                  offset: Offset(-2, -2)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDescriptionAndImage(
      Map<String, String> cartoon, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildAnimatedDescription(cartoon["description"]!, screenWidth),
        _buildAnimatedImage(cartoon["image"]!, screenWidth),
      ],
    );
  }

  Widget _buildAnimatedDescription(String description, double screenWidth) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: -500, end: 0),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(value, 0),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 1000),
            opacity: _opacity,
            child: SizedBox(
              width: screenWidth * 0.35,
              child: Text(
                description,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedImage(String imageUrl, double screenWidth) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 500, end: 0),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(value, 0),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 1000),
            opacity: _opacity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                width: screenWidth * 0.4,
                height: 120,
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      },
    );
  }

  static const _cartoons = [
    {
      "name": "Tom & Jerry",
      "description": "The classic rivalry between a cat and a mouse.",
      "image": "https://pngimg.com/d/tom_and_jerry_PNG43.png",
    },
    {
      "name": "SpongeBob SquarePants",
      "description": "A sponge living under the sea with his quirky friends.",
      "image":
          "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/e4638f60-ecd7-4228-b667-e7628252709e/dgwed9x-6a2bacaa-8ecb-4275-bde7-77b16d19ea67.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2U0NjM4ZjYwLWVjZDctNDIyOC1iNjY3LWU3NjI4MjUyNzA5ZVwvZGd3ZWQ5eC02YTJiYWNhYS04ZWNiLTQyNzUtYmRlNy03N2IxNmQxOWVhNjcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.USyw2D0G5O9oTz2sfZ_n60YQvcjpRlM_X79lVV8z2mY",
    },
    {
      "name": "Scooby-Doo",
      "description": "A mystery-solving dog with his gang of friends.",
      "image":
          "https://p.kindpng.com/picc/s/18-183878_scooby-doo-gang-png-transparent-png.png",
    },
    {
      "name": "Looney Tunes",
      "description": "Featuring characters like Bugs Bunny and Daffy Duck.",
      "image":
          "https://th.bing.com/th/id/R.8cfc7df819e0c9af04708eca1d37265b?rik=7s3kDeXnldyUpQ&pid=ImgRaw&r=0",
    },
    {
      "name": "The Simpsons",
      "description":
          "A comedic look at family life in the town of Springfield.",
      "image":
          "https://www.pngarts.com/files/11/Homer-Bart-Simpson-PNG-Transparent-Image.png",
    },
    {
      "name": "Adventure Time",
      "description": "A boy and his magical dog go on whimsical adventures.",
      "image":
          "https://th.bing.com/th/id/R.c298b5ce8cd884735e5ea1e2ef47129a?rik=aF6nfq%2bXYRTPoA&pid=ImgRaw&r=0",
    },
    {
      "name": "Rick and Morty",
      "description": "A mad scientist and his grandson explore the multiverse.",
      "image":
          "https://rosepng.com/wp-content/uploads/2024/10/s11728_rick_and_morty_isolated_on_white_background_-stylize__c7436d3e-a30c-4fc2-b601-dc73b2582c7d_0-photoroom-300x300.png",
    },
    {
      "name": "Phineas and Ferb",
      "description":
          "Stepbrothers create amazing inventions during their summer vacation.",
      "image":
          "https://www.pngarts.com/files/3/Phineas-And-Ferb-Transparent-Image.png",
    },
    {
      "name": "Dragon Ball Z",
      "description":
          "The adventures of Goku and his friends in their fight against powerful foes.",
      "image":
          "https://th.bing.com/th/id/OIP.69mFptwzS_D917CHSn1olQHaIH?rs=1&pid=ImgDetMain",
    },
    {
      "name": "Avatar: The Last Airbender",
      "description":
          "A young boy with the power to control all elements must save the world.",
      "image":
          "https://th.bing.com/th/id/R.bab4d08a1d015f837300dc176d8be96e?rik=ZXimljfTJ1hx1Q&pid=ImgRaw&r=0",
    },
  ];
}



