import 'package:flutter/material.dart';
import 'package:flutter_animation/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ColorResources {
  static Color white(BuildContext context) =>
      Provider.of<ThemeProvider>(context).isDarkMode
          ? const Color(0xff000000)
          : const Color(0xffffffff);

  static Color primaryColor(BuildContext context) =>
      Provider.of<ThemeProvider>(context).isDarkMode
          ? const Color(0xff445864)
          : const Color(0xffffffff);

  static Color questionColor(BuildContext context) =>
      Provider.of<ThemeProvider>(context).isDarkMode
          ? const Color(0xffe0e0e0)
          : const Color(0xff3c3c3c);

  static Color red = const Color(0xffff6961);
  static Color green = const Color(0xff77dd77);
  static Color orange = const Color(0xffffb347);
  static Color purple = const Color(0xffc899c9);
  static Color headingColor(BuildContext context) =>
      Provider.of<ThemeProvider>(context).isDarkMode
          ? const Color(0xff63c1a6)
          : const Color(0xff044230);
}
