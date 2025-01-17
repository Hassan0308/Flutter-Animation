import 'package:flutter/material.dart';
import 'package:flutter_animation/util/color_resources.dart';

class InfoCardItem extends StatefulWidget {
  final String title;
  final String content;
  final Color color;
  final bool isExpanded;
  final VoidCallback onTap;

  const InfoCardItem({
    Key? key,
    required this.title,
    required this.content,
    required this.color,
    required this.isExpanded,
    required this.onTap,
  }) : super(key: key);

  @override
  State<InfoCardItem> createState() => _InfoCardItemState();
}

class _InfoCardItemState extends State<InfoCardItem>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _sizeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void didUpdateWidget(covariant InfoCardItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Card Title with Icon for expanding/collapsing
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorResources.primaryColor(context),
                border: Border.all(color: widget.color, width: 1),
                borderRadius: BorderRadius.vertical(
                  top: const Radius.circular(10),
                  bottom: Radius.circular(widget.isExpanded ? 0 : 10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      widget.title,
                      style: TextStyle(
                          color: widget.color,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Icon(
                      widget.isExpanded ? Icons.remove : Icons.add,
                      color: widget.color,
                    ),
                  ),
                ],
              ),
            ),
            // Smoothly animated content using SizeTransition
            SizeTransition(
              sizeFactor: _sizeAnimation,
              axisAlignment: -1.0,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ColorResources.primaryColor(context),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                ),
                child: Text(
                  widget.content,
                  style: TextStyle(
                      fontSize: 16, color: ColorResources.questionColor(context)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
