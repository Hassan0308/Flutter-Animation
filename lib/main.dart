import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eid Mubarak!',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: 'Poppins',
      ),
      home: const EidAnimationScreen(),
    );
  }
}

class EidAnimationScreen extends StatefulWidget {
  const EidAnimationScreen({super.key});

  @override
  State<EidAnimationScreen> createState() => _EidAnimationScreenState();
}

class _EidAnimationScreenState extends State<EidAnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController _moonController;
  late AnimationController _mosqueController;
  late AnimationController _textController;
  
  // Animations for moon (position + opacity)
  late Animation<Offset> _moonSlideAnimation;
  late Animation<double> _moonOpacityAnimation;
  
  // Animations for mosque (position + opacity)
  late Animation<Offset> _mosqueSlideAnimation;
  late Animation<double> _mosqueOpacityAnimation;

  @override
  void initState() {
    super.initState();
    
    // Moon animation setup
    _moonController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    
    _moonSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -1.5), // Start above screen
      end: const Offset(0, 0.15),   // Final position (15% from top)
    ).animate(CurvedAnimation(
      parent: _moonController,
      curve: Curves.easeOutBack,
    ));
    
    _moonOpacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_moonController);
    
    // Mosque animation setup
    _mosqueController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    
    _mosqueSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1.5), // Start below screen
      end: Offset.zero,            // Final position
    ).animate(CurvedAnimation(
      parent: _mosqueController,
      curve: Curves.easeOutBack,
    ));
    
    _mosqueOpacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_mosqueController);
    
    // Text animation
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    
    // Start animations sequentially
    Future.delayed(const Duration(milliseconds: 300), () {
      _moonController.forward();
    });
    
    Future.delayed(const Duration(milliseconds: 800), () {
      _mosqueController.forward();
    });
    
    Future.delayed(const Duration(milliseconds: 1500), () {
      _textController.forward();
    });
  }

  @override
  void dispose() {
    _moonController.dispose();
    _mosqueController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050A18),
      body: Stack(
        children: [
          // Background stars
          _buildStars(),
          
          // Animated Moon (slides down with fade-in)
          Positioned(
            top: 0,
            left: 20,
            child: SlideTransition(
              position: _moonSlideAnimation,
              child: FadeTransition(
                opacity: _moonOpacityAnimation,
                child: const Image(
                  image: AssetImage('assets/image.png'),
                  height: 150,
                ),
              ),
            ),
          ),
          
          // Animated Mosque (slides up with fade-in)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SlideTransition(
              position: _mosqueSlideAnimation,
              child: FadeTransition(
                opacity: _mosqueOpacityAnimation,
                child: Image(
                  image: const AssetImage('assets/mosque.png'),
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          
          // Eid Card (scales in)
          Center(
            child: ScaleTransition(
              scale: CurvedAnimation(
                parent: _textController,
                curve: Curves.bounceOut,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.amber.withOpacity(0.3),
                  ),
                ),
                child: Stack(
                  children: [
                    const Positioned(
                      top: 0,
                      right: 0,
                      child: Image(
                        image: AssetImage('assets/cart_fanoos.png'),
                        width: 100,
                        height: 120,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Eid Mubarak!",
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                              shadows: [
                                Shadow(
                                  blurRadius: 10,
                                  color: Colors.amber,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "May this Eid bring you joy, peace, and countless blessings.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStars() {
    return IgnorePointer(
      child: SizedBox.expand(
        child: CustomPaint(
          painter: _StarPainter(),
        ),
      ),
    );
  }
}

class _StarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Random random = Random();
    final Paint paint = Paint()
      ..color = Colors.amber.withOpacity(0.7)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 10; i++) {
      final double x = random.nextDouble() * size.width;
      final double y = random.nextDouble() * size.height;
      final double radius = random.nextDouble() * 1.5;
      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}