import 'package:flutter/material.dart';
import 'dart:math';

import 'clip_path_examples /clip_path_screen.dart';

class FlowerShapeClipper extends CustomClipper<Path> {
  final double petalLength = 40.0;

  @override
  Path getClip(Size size) {
    final path = Path();

    for (double angle = 0; angle < 2 * pi; angle += pi / 3) {
      double x = size.width / 2 + petalLength * cos(angle);
      double y = size.height / 2 + petalLength * sin(angle);

      path.moveTo(size.width / 2, size.height / 2);
      path.quadraticBezierTo(size.width / 2, size.height / 2 - petalLength / 2, x, y);
      path.quadraticBezierTo(size.width / 2, size.height / 2 + petalLength / 2, size.width / 2, size.height / 2);
    }

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ColorShapeSlider extends StatefulWidget {
  @override
  _ColorShapeSliderState createState() => _ColorShapeSliderState();
}

class _ColorShapeSliderState extends State<ColorShapeSlider> {
  double _sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [calculateProfessionalColor(_sliderValue), Colors.white], // Blue to White gradient
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: calculateProfessionalColor(_sliderValue),
                  shape: _calculateShape(),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipPath(
                  clipper: FlowerShapeClipper(),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [_calculatePetalColor(), Colors.white],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Slider(
                value: _sliderValue,
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
              ),
        SizedBox(height: 20),
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.white,
          child: Text(
            'H',
            style: TextStyle(
              fontSize: 30,
              color: calculateProfessionalColor(_sliderValue),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Hello Hassan',
          style: TextStyle(
            fontSize: 20,
            color: _calculatePetalColor(),
          ),)
            ],
          ),
        ),
      ),
    );
  }

  Color calculateProfessionalColor(double sliderValue) {
    return Color.lerp(Color(0xFF0F7CE8), Color(0xFF67AEAF), sliderValue) ?? Color(
        0xFF1E3146);
  }

  Color _calculatePetalColor() {
    return Color.lerp(Color(0xFFF39C12), Color(0xFFE67E22), _sliderValue) ?? Color(0xFFF39C12); // Orange to Dark Orange
  }


  BoxShape _calculateShape() {
    return _sliderValue > 0.5 ? BoxShape.circle : BoxShape.rectangle;
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ClipPathScreen(),
  ));
}
