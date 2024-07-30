import 'package:flutter/material.dart';
import 'package:flutter_animation/provider/matrix4_transformation2_provider.dart';
import 'package:provider/provider.dart';

class Matrix4Transformation2Screen extends StatefulWidget {
  const Matrix4Transformation2Screen({super.key});

  @override
  State<Matrix4Transformation2Screen> createState() =>
      _Matrix4Transformation2ScreenState();
}

class _Matrix4Transformation2ScreenState
    extends State<Matrix4Transformation2Screen> with TickerProviderStateMixin {
  @override
  void initState() {
    Provider.of<Matrix4Transformation2Provider>(context, listen: false)
        .initializeAnimation(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var provider =
        Provider.of<Matrix4Transformation2Provider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: const Text("Matrix4 Transformation"),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: Listenable.merge(
                  [provider.controller1, provider.controller2]),
              builder: (context, child) {
                return Transform(
                  transform: Matrix4.identity()
                    ..rotateX(provider.animation2.value)
                    ..rotateY(provider.animation2.value)
                    ..rotateZ(0),
                  alignment: FractionalOffset.center,
                  child: SizedBox(
                    height: height * 0.5,
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      mainAxisSpacing: provider.animation1.value,
                      crossAxisSpacing: provider.animation1.value,
                      children: List.generate(9, (index) {
                        return Container(
                          color: Colors.black,
                          height: 20,
                          width: 20,
                        );
                      }),
                    ),
                  ),
                );
              },
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.indigoAccent),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  provider.animate();
                },
                child: const Text("Click me"))
          ],
        ),
      ),
    );
  }
}
