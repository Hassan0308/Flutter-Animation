import 'package:flutter/material.dart';
import 'package:flutter_animation/provider/bouncing_scroll_simulation_provier.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    Provider.of<BouncingScrollSimulationProvider>(context, listen: false)
        .initializeController(this, _scrollController);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BouncingScrollSimulationProvider>(context,listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Bouncing Scroll Simulation')),
      body: GestureDetector(
        onPanUpdate: provider.onPanUpdate,
        onPanEnd: provider.onPanEnd,
        child: ListView.builder(
          controller: _scrollController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              color: Colors.primaries[index % Colors.primaries.length],
              child: Center(
                  child: Text('${index + 1}',
                      style:
                          const TextStyle(fontSize: 24, color: Colors.white))),
            );
          },
        ),
      ),
    );
  }
}
