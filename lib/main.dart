
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MotivationalAnimation(),
      debugShowCheckedModeBanner: false,
    );
  }
}



class MotivationalAnimation extends StatefulWidget {
  @override
  _MotivationalAnimationState createState() => _MotivationalAnimationState();
}

class _MotivationalAnimationState extends State<MotivationalAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isStop = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 100).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Motivational Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _animation.value / 100 * 2 * pi,
                  child: MotivationalText(_animation.value),
                );
              },
            ),
            SizedBox(height: 100,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isStop?Colors.green:Colors.red
                ),
                onPressed: (){
              if(!isStop){
                _controller.stop();
                isStop = true;
              }else{
                _controller.repeat(reverse: true);
                isStop = false;
              }
              setState(() {

              });
            }, child: isStop?Text("Play Now!"):Text("Stop Now"))
          ],
        ),

      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class MotivationalText extends StatelessWidget {
  final double animationValue;

  MotivationalText(this.animationValue);

  @override
  Widget build(BuildContext context) {
    // Calculate rotation angle based on animation value
    double rotation = animationValue / 100 * 2 * pi;

    // Calculate color based on animation value
    Color textColor = Color.lerp(Colors.black, Colors.green, animationValue / 100) ?? Colors.blue;

    // Use yellow as the background color for motivation
    Color backgroundColor = Colors.yellow;

    return Transform.rotate(
      angle: rotation,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          'You can do it!',
          style: TextStyle(
            fontSize: 24,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

