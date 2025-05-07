import 'package:awwao/othersscreen/bangla_month.dart';
import 'package:awwao/othersscreen/bangla_namta.dart';
import 'package:awwao/othersscreen/bangla_number.dart';
import 'package:awwao/othersscreen/bangla_poem.dart';
import 'package:awwao/othersscreen/bangla_season.dart';
import 'package:awwao/othersscreen/bangla_week.dart';
import 'package:awwao/othersscreen/banjonborno_screen.dart';
import 'package:awwao/othersscreen/shorborno_screen.dart';
import 'package:flutter/material.dart';

class BanglaScreen extends StatefulWidget {
  const BanglaScreen({super.key});

  @override
  State<BanglaScreen> createState() => _BanglaScreenState();
}

class _BanglaScreenState extends State<BanglaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color(0xFFFFFFFF),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'বাংলা শিখি',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFFFFF),
            fontSize: 24,
            fontFamily: 'Hind Siliguri',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(
                0xFF81C784,
              ).withOpacity(0.8), // Light green with transparency
              Color(0xFF4CAF50), // Base green
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    _buildCategoryCard(
                      title: 'স্বরবর্ণ',
                      subtitle: 'অ থেকে ঔ',
                      icon: 'assets/icons/vowels.png',
                      bgColor: const Color(0xFFE91E63),
                      onTap: () => _navigateTo(context, ShoroBornoScreen()),
                    ),
                    _buildCategoryCard(
                      title: 'ব্যঞ্জনবর্ণ',
                      subtitle: 'ক থেকে ঁ',
                      icon: 'assets/icons/consonants.png',
                      bgColor: const Color(0xFF2196F3),
                      onTap: () => _navigateTo(context, BanjonBornoScreen()),
                    ),
                    _buildCategoryCard(
                      title: 'সংখ্যা',
                      subtitle: '০ থেকে ১০০',
                      icon: 'assets/icons/bangla-number.png',
                      bgColor: const Color(0xFF4C87AF),
                      onTap: () => _navigateTo(context, BanglaNumberScreen()),
                    ),
                    _buildCategoryCard(
                      title: 'নামতা',
                      subtitle: '১ থেকে ১০',
                      icon: 'assets/icons/multiplication.png',
                      bgColor: const Color(0xFF3F51B5),
                      onTap:
                          () => _navigateTo(context, const BanglaNamtaScreen()),
                    ),
                    _buildCategoryCard(
                      title: 'সপ্তাহ',
                      subtitle: 'বাংলা ৭ দিনের নাম',
                      icon: 'assets/icons/weeks.png',
                      bgColor: const Color(0xFF9C27B0),
                      onTap: () => _navigateTo(context, const BanglaWeek()),
                    ),
                    _buildCategoryCard(
                      title: 'মাস',
                      subtitle: 'বাংলা ১২ মাসের নাম',
                      icon: 'assets/icons/months.png',
                      bgColor: const Color(0xFFEC1D8F),
                      onTap: () => _navigateTo(context, const BanglaMonth()),
                    ),
                    _buildCategoryCard(
                      title: 'ঋতু',
                      subtitle: '৬ ঋতু',
                      icon: 'assets/icons/seasons.png',
                      bgColor: const Color(0xFF00BCD4),
                      onTap: () => _navigateTo(context, const BanglaSeason()),
                    ),
                    _buildCategoryCard(
                      title: 'কবিতা',
                      subtitle: 'ছোট কবিতা',
                      icon: 'assets/icons/poem.png',
                      bgColor: const Color(0xFF795548),
                      onTap: () => _navigateTo(context, const BanglaPoem()),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      backgroundColor: Colors.green.shade50,
    );
  }

  // Enhanced Category Card
  Widget _buildCategoryCard({
    required String title,
    required String subtitle,
    required String icon,
    required Color bgColor,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 8,
      shadowColor: bgColor.withOpacity(0.4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        splashColor: bgColor.withOpacity(0.2),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [bgColor.withOpacity(0.8), bgColor],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon placeholder (would be replaced with actual image)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    icon,
                    width: 50,
                    height: 50,
                    // color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.8),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Simple navigation without animation
  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }
}
