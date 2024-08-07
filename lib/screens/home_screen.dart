import 'package:flutter/material.dart';
import 'package:flutter_animation/provider/color_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Provider.of<ColorProvider>(context, listen: false).init(this);
  }

  @override
  Widget build(BuildContext context) {
    var colorProvider = Provider.of<ColorProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sequence Tween'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: colorProvider.colorAnimation,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                // Container with changing color
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorProvider.colorAnimation.value,
                  ),
                ),
                // Indeterminate Circular Progress Indicator
                const CircularProgressIndicator(
                  value: null,
                  strokeWidth: 4.0,
                  color: Colors.white,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    Provider.of<ColorProvider>(context, listen: false).dispose();
    super.dispose();
  }
}
