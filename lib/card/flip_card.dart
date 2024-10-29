import 'package:flutter/material.dart';
import 'package:flutter_animation/provider/flip_card_provider.dart';
import 'package:provider/provider.dart';

class FlipCard extends StatefulWidget {
  final String backImagePath;
  final int index;
  final int id;
  final bool isFlipped;
  final String frontImagePath;

  const FlipCard({
    Key? key,
    required this.backImagePath,
    required this.index,
    required this.id,
    required this.isFlipped,
    required this.frontImagePath,
  }) : super(key: key);

  @override
  _FlipCardState createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    if (widget.isFlipped) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(FlipCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isFlipped != oldWidget.isFlipped) {
      if (widget.isFlipped) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double cardWidth = MediaQuery.of(context).size.width * 0.8;
    final double cardHeight = MediaQuery.of(context).size.height * 0.5;

    return GestureDetector(
      onTap: () {
        final flipCardProvider =
            Provider.of<FlipCardProvider>(context, listen: false);
        if (flipCardProvider.isTimmer)
          flipCardProvider.flipCard(widget.index, widget.id);
      },
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
                _buildBackCard(cardWidth, cardHeight),
                if (widget.isFlipped)
                  if (_controller.value > 0.5)
                    _buildFrontCard(cardWidth, cardHeight),
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
