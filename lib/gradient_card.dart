import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientCard extends StatelessWidget {
  final String quote;
  final List<Color> gradientColors;
  final String backgroundImage;
  final Color quoteColor;

  const GradientCard({
    Key? key,
    required this.quote,
    required this.gradientColors,
    required this.backgroundImage,
    required this.quoteColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: gradientColors,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Stack(
            children: [
              // Add a background image with opacity
              Opacity(
                opacity: 0.6,
                child: Image.asset(
                  backgroundImage,
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Text(
                  quote,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: quoteColor,
                      letterSpacing: 1.5,
                      height: 1.5,
                      shadows: [
                        Shadow(
                          offset: Offset(3.0, 3.0),
                          blurRadius: 6.0,
                          color:
                              Color.fromARGB(255, 83, 82, 82).withOpacity(0.4),
                        ),
                      ],
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(249, 21, 215, 1),
                Color.fromRGBO(22, 0, 98, 1)
              ],
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Center(
            child: Image.asset(
              'assets/image.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
