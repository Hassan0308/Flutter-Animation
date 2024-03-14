import 'package:flutter/material.dart';


class ClipPathScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ClipPath Example'),
        ),
        body: Center(
          child: ClipPath(
            clipper: MyClipper(),
            child: Container(
              width: 200.0,
              height: 200.0,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Clipped Content',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Define the clipping path here
    Path path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width / 2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
