import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomShapesScreen extends StatefulWidget {
  const CustomShapesScreen({Key? key}) : super(key: key);

  @override
  State<CustomShapesScreen> createState() => _CustomShapesScreenState();
}

class _CustomShapesScreenState extends State<CustomShapesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ClipPath(
          clipper: CustomClipPath() ,
          child: Container(
            height: 300,
            width: double.infinity,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
class CustomClipPath extends CustomClipper<Path>{
  @override
  getClip(Size size) {
  double h = size.height;
  double w = size.width;

  //declar
    final path = Path();
    //point
    path.lineTo(0, h);
    //point 3 , 4
    path.lineTo(w, h);
    //point 5 ,6
    path.lineTo(w, 0);

    path.close();

    return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    throw false;
  }

}
