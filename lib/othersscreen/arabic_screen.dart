import 'package:awwao/othersscreen/arabic_doa_screen.dart';
import 'package:awwao/othersscreen/arabic_letter_screen.dart';
import 'package:awwao/othersscreen/arabic_month_screen.dart';
import 'package:awwao/othersscreen/arabic_numbers_screen.dart';
import 'package:awwao/othersscreen/arabic_prayer_intention_screen.dart';
import 'package:awwao/othersscreen/arabic_prayer_rules_screen.dart';
import 'package:awwao/othersscreen/arabic_sura_screen.dart';
import 'package:awwao/othersscreen/arabic_tasbeeh_screen.dart';
import 'package:awwao/othersscreen/arabic_week_screen.dart';
import 'package:awwao/othersscreen/arabic_zikir_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ArabicScreen extends StatefulWidget {
  const ArabicScreen({super.key});

  @override
  State<ArabicScreen> createState() => _ArabicScreenState();
}

class _ArabicScreenState extends State<ArabicScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Define cheerful, bright colors for kids
  final List<Color> cardColors = [
    const Color(0xFFFFD1DC), // Light pink
    const Color(0xFFB5EAD7), // Mint green
    const Color(0xFFC7CEEA), // Periwinkle
    const Color(0xFFFFF1C9), // Pastel yellow
    const Color(0xFFFFB347), // Pastel orange
    const Color(0xFF9EE09E), // Light green
    const Color(0xFFD0A9FF), // Light purple
    const Color(0xFF87CEEB), // Sky blue
    const Color(0xFFFFDAB9), // Peach
    const Color(0xFFC1E1C1), // Pistachio
  ];

  final List<Color> iconColors = [
    const Color(0xFFFF6B81), // Watermelon
    const Color(0xFF4CAF50), // Green
    const Color(0xFF5D6DBA), // Royal blue
    const Color(0xFFFC9F4D), // Orange
    const Color(0xFFFF8000), // Darker orange
    const Color(0xFF2E8B57), // Sea green
    const Color(0xFF9370DB), // Medium purple
    const Color(0xFF1E90FF), // Dodger blue
    const Color(0xFFFF7F50), // Coral
    const Color(0xFF009688), // Teal
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'আরবী শেখার মজার জগৎ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 22,
                fontFamily: 'Hind Siliguri',
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: const Color(
          0xFF6A5ACD,
        ), // Slate blue - kid-friendly but not too bright
        elevation: 8,
      ),
      backgroundColor: const Color(0xFFF0F8FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Bouncing welcome character
              Container(
                height: 80,
                margin: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (BuildContext context, Widget? child) {
                        return Transform.translate(
                          offset: Offset(
                            0,
                            10 * math.sin(_controller.value * math.pi * 2),
                          ),
                          child: child,
                        );
                      },
                    ),
                    const SizedBox(width: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: const Text(
                        'আরবী শিখতে প্রস্তুত?',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6A5ACD),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Category grid
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildCategoryCard(
                      context,
                      'আরবী অক্ষর/হরফ',
                      Icons.text_fields_rounded,
                      cardColors[0],
                      iconColors[0],
                      'অক্ষর শিখি!',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ArabicLettersScreen(),
                        ),
                      ),
                    ),
                    _buildCategoryCard(
                      context,
                      'আরবী সংখ্যা',
                      Icons.format_list_numbered_rounded,
                      cardColors[1],
                      iconColors[1],
                      'সংখ্যা গণি!',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ArabicNumbersScreen(),
                        ),
                      ),
                    ),
                    _buildCategoryCard(
                      context,
                      'সপ্তাহের নাম',
                      Icons.calendar_today_rounded,
                      cardColors[2],
                      iconColors[2],
                      'দিন চিনি!',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WeekdaysScreen(),
                        ),
                      ),
                    ),
                    _buildCategoryCard(
                      context,
                      'মাসের নাম',
                      Icons.calendar_month_rounded,
                      cardColors[3],
                      iconColors[3],
                      'মাস জানি!',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MonthsScreen(),
                        ),
                      ),
                    ),
                    _buildCategoryCard(
                      context,
                      'দোয়া',
                      Icons.auto_stories_rounded,
                      cardColors[4],
                      iconColors[4],
                      'দোয়া শিখি!',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DuaScreen(),
                        ),
                      ),
                    ),
                    _buildCategoryCard(
                      context,
                      'জিকির',
                      Icons.favorite_rounded,
                      cardColors[5],
                      iconColors[5],
                      'জিকির করি!',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ZikirScreen(),
                        ),
                      ),
                    ),
                    _buildCategoryCard(
                      context,
                      'ছোট সুরা',
                      Icons.menu_book_rounded,
                      cardColors[6],
                      iconColors[6],
                      'সুরা পড়ি!',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SurahScreen(),
                        ),
                      ),
                    ),
                    _buildCategoryCard(
                      context,
                      'নামাজের নিয়ম',
                      Icons.accessibility_new_rounded,
                      cardColors[7],
                      iconColors[7],
                      'নিয়ম শিখি!',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrayerRulesScreen(),
                        ),
                      ),
                    ),
                    _buildCategoryCard(
                      context,
                      'নামাজের নিয়ত',
                      Icons.sentiment_satisfied_rounded,
                      cardColors[8],
                      iconColors[8],
                      'নিয়ত জানি!',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrayerIntentionScreen(),
                        ),
                      ),
                    ),
                    _buildCategoryCard(
                      context,
                      'তাসবীহ',
                      Icons.touch_app_rounded,
                      cardColors[9],
                      iconColors[9],
                      'তাসবীহ গণি!',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TasbeehScreen(),
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
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    String title,
    IconData icon,
    Color bgColor,
    Color iconColor,
    String tagline,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 6,
        shadowColor: iconColor.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: iconColor.withOpacity(0.3), width: 2),
        ),
        color: bgColor,
        child: Stack(
          children: [
            // Main content
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon with background
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: iconColor.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Icon(icon, size: 32, color: iconColor),
                  ),
                  const SizedBox(height: 12),
                  // Title
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                      fontFamily: 'Hind Siliguri',
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Fun tagline
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      tagline,
                      style: TextStyle(
                        fontSize: 12,
                        color: iconColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Small decorative stars
            Positioned(
              top: 5,
              right: 5,
              child: Icon(
                Icons.star,
                size: 15,
                color: iconColor.withOpacity(0.5),
              ),
            ),
            Positioned(
              bottom: 5,
              left: 5,
              child: Icon(
                Icons.star,
                size: 15,
                color: iconColor.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
