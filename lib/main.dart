import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Animation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  late AnimationController _animationController ;
  late Animation<double> positionAnimation;
  @override
  void initState() {
    //initiate animation controller
   _animationController=AnimationController(vsync: this,duration: Duration(seconds: 3));
   //initiate animation
   positionAnimation = Tween<double>(begin: 0.0,end: 2*math.pi,).animate(_animationController);
   //animation start
    _animationController.repeat();
    super.initState();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: positionAnimation,
          builder: (context,index){
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..rotateZ(positionAnimation.value),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.green,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.5),
                        spreadRadius: 6,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow

                      ),
                    ]
                ),
              ),
            );
          },

        ),
      ),
    );
  }
}
