import 'package:flutter/material.dart';
import 'package:flutter_animation/provider/flip_card_provider.dart';
import 'package:provider/provider.dart';

class FlipCard extends StatefulWidget {
  final String backImagePath;
  final String frontImagePath;

  const FlipCard({
    Key? key,
    required this.backImagePath,
    required this.frontImagePath,
  }) : super(key: key);

  @override
  _FlipCardProvider createState() => _FlipCardProvider();
}

class _FlipCardProvider extends State<FlipCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipCard() {
    final flipCardProvider = Provider.of<FlipCardProvider>(context, listen: false);

    if (flipCardProvider.isFlipped) {
      _controller.reverse().then((_) {
        if (mounted) {
          flipCardProvider.flip();
        }
      });
    } else {
      _controller.forward().then((_) {
        if (mounted) {
          flipCardProvider.triggerCelebration();
          flipCardProvider.flip();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double cardWidth = MediaQuery.of(context).size.width * 0.8;
    final double cardHeight = MediaQuery.of(context).size.height * 0.5;

    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          var angle = _controller.value * 3.14;
          var scale = 1 - (_controller.value * 0.1);
          var perspective = 0.003;

          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, perspective)
              ..scale(scale, scale, 1.0)
              ..rotateY(angle),
            alignment: Alignment.center,
            child: Stack(
              children: [
                _buildFrontCard(cardWidth, cardHeight),
                if (_controller.value > 0.5) _buildBackCard(cardWidth, cardHeight),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFrontCard(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: Offset(5, 5),
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          widget.frontImagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildBackCard(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: Offset(5, 5),
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          widget.backImagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
