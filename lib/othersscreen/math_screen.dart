import 'package:awwao/othersscreen/math_learning.dart';
import 'package:flutter/material.dart';

class MathScreen extends StatelessWidget {
  const MathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 28),
          color: const Color(0xFFFFFFFF),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'অংক শেখা',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFFFFF),
                fontSize: 26,
                fontFamily: 'Hind Siliguri',
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: const Color(
          0xFF6A40B8,
        ), // Deep purple - more kid-friendly but still formal
        elevation: 4,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF8F9FF), Color(0xFFEFF1F9)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.lightbulb_outline_rounded,
                        color: Color(0xFFFFB830),
                        size: 26,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'আসুন খেলার মাধ্যমে অংক শিখি',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF444444),
                            fontFamily: 'Hind Siliguri',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.9, // Slightly taller cards
                    children: [
                      _buildOperationCard(
                        context,
                        'যোগ',
                        'assets/images/addition.png',
                        Icons.add_circle_rounded,
                        const Color(0xFF4CAF50), // Green
                        MathOperation.addition,
                      ),
                      _buildOperationCard(
                        context,
                        'বিয়োগ',
                        'assets/images/subtraction.png',
                        Icons.remove_circle_rounded,
                        const Color(0xFFF44336), // Red
                        MathOperation.subtraction,
                      ),
                      _buildOperationCard(
                        context,
                        'গুণ',
                        'assets/images/multiplication.png',
                        Icons.star_rounded,
                        const Color(0xFFFF9800), // Orange
                        MathOperation.multiplication,
                      ),
                      _buildOperationCard(
                        context,
                        'ভাগ',
                        'assets/images/division.png',
                        Icons.show_chart_rounded,
                        const Color(0xFF9C27B0), // Purple
                        MathOperation.division,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE0F2F1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.emoji_events_rounded,
                          color: Color(0xFF009688),
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'প্রতি দিন অংক চর্চা করুন, পুরষ্কার জিতুন!',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF444444),
                            fontFamily: 'Hind Siliguri',
                          ),
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
    );
  }

  Widget _buildOperationCard(
    BuildContext context,
    String title,
    String imagePath,
    IconData fallbackIcon,
    Color color,
    MathOperation operation,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MathLearning(operation: operation),
          ),
        );
      },
      child: Card(
        elevation: 8,
        shadowColor: color.withOpacity(0.4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color.withOpacity(0.8), color],
            ),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Try to load image asset first, fallback to icon if not found
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.asset(
                    imagePath,
                    width: 60,
                    height: 60,
                    errorBuilder:
                        (context, error, stackTrace) =>
                            Icon(fallbackIcon, size: 50, color: color),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: color.withAlpha(240),
                    fontFamily: 'Hind Siliguri',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
