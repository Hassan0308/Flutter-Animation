import 'package:flutter/material.dart';

class InfoCard {
  final String title;
  final String content;
  bool isExpanded;
  final Color color;

  InfoCard(
      {required this.title,
      required this.content,
      this.isExpanded = false,
      required this.color});
}
