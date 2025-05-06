import 'package:flutter/material.dart';
import 'package:awwao/classes/user_persistence.dart';
import 'dart:math' as math hide Random;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeInAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _controller.forward();

    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 3));

    final isLoggedIn = await UserPersistence.isLoggedIn();

    if (mounted) {
      if (isLoggedIn) {
        Navigator.pushReplacementNamed(context, '/main');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF81C784), // Light green
              Color(0xFF4CAF50), // Base green
            ],
          ),
        ),
        child: Stack(
          children: [
            // Decorative background elements
            Positioned.fill(
              child: FadeTransition(
                opacity: _fadeInAnimation,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return CustomPaint(
                      painter: BackgroundPainter(_controller.value),
                      child: Container(),
                    );
                  },
                ),
              ),
            ),

            // Circular gradient overlay
            Center(
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Colors.white.withOpacity(0.7),
                      Colors.white.withOpacity(0.0),
                    ],
                    stops: const [0.2, 1.0],
                  ),
                ),
              ),
            ),

            // Content
            Center(
              child: FadeTransition(
                opacity: _fadeInAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // App Logo
                    ScaleTransition(
                      scale: _scaleAnimation,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: const [
                              Icon(
                                Icons.school,
                                size: 70,
                                color: Color(0xFF388E3C), // Darker green
                              ),
                              Positioned(
                                bottom: 25,
                                right: 20,
                                child: Icon(
                                  Icons.auto_stories,
                                  size: 25,
                                  color: Color(0xFFFFA000), // Amber accent
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // App Name
                    const Text(
                      'ইশকুল',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black26,
                            blurRadius: 4.0,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // First slogan
                    const Text(
                      'শুরু হোক জ্ঞান ভ্রমণ!',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black26,
                            blurRadius: 3.0,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Second slogan
                    const Text(
                      'জ্ঞানের রাজ্যে তোমাকে স্বাগতম',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black26,
                            blurRadius: 2.0,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom painter for beautiful background elements
class BackgroundPainter extends CustomPainter {
  final double animationValue;

  BackgroundPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.white.withOpacity(0.2)
          ..style = PaintingStyle.fill;

    // Draw educational symbols
    _drawSymbol(canvas, size, 0.2, 0.3, 40, Icons.book, paint);
    _drawSymbol(canvas, size, 0.8, 0.2, 50, Icons.nature, paint);
    _drawSymbol(canvas, size, 0.7, 0.7, 45, Icons.pets, paint);
    _drawSymbol(canvas, size, 0.3, 0.8, 55, Icons.calculate, paint);
    _drawSymbol(canvas, size, 0.5, 0.5, 60, Icons.eco, paint);
    _drawSymbol(canvas, size, 0.2, 0.6, 40, Icons.music_note, paint);
    _drawSymbol(canvas, size, 0.8, 0.8, 50, Icons.language, paint);
    _drawSymbol(canvas, size, 0.1, 0.1, 45, Icons.local_florist, paint);
  }

  void _drawSymbol(
    Canvas canvas,
    Size size,
    double relX,
    double relY,
    double iconSize,
    IconData icon,
    Paint paint,
  ) {
    // Adjust positions based on animation
    final offsetX =
        size.width * relX + (20 * (animationValue * 2 - 1) * (relX - 0.5));
    final offsetY =
        size.height * relY +
        (20 * Math.sin(animationValue * 2 * Math.pi) * (relY - 0.5));

    final textPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: iconSize,
          fontFamily: icon.fontFamily,
          color: paint.color,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(offsetX - textPainter.width / 2, offsetY - textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(BackgroundPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}

// Helper class for math operations
class Math {
  static double sin(double radians) {
    return math.sin(radians);
  }

  static double pi = math.pi;
}
