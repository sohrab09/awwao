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

class ArabicScreen extends StatelessWidget {
  const ArabicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'আরবী শেখার অ্যাপ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFFFFF),
            fontSize: 24,
            fontFamily: 'Hind Siliguri',
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF45F7F7),
        elevation: 2,
      ),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildCategoryCard(
                  context,
                  'আরবী অক্ষর/হরফ',
                  Icons.font_download,
                  Colors.red.shade100,
                  Colors.red,
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
                  Icons.format_list_numbered,
                  Colors.blue.shade100,
                  Colors.blue,
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
                  Icons.calendar_today,
                  Colors.green.shade100,
                  Colors.green,
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
                  Icons.calendar_month,
                  Colors.orange.shade100,
                  Colors.orange,
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
                  Icons.auto_stories,
                  Colors.purple.shade100,
                  Colors.purple,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DuaScreen()),
                  ),
                ),
                _buildCategoryCard(
                  context,
                  'জিকির',
                  Icons.favorite,
                  Colors.pink.shade100,
                  Colors.pink,
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
                  Icons.menu_book,
                  Colors.amber.shade100,
                  Colors.amber,
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
                  Icons.accessibility_new,
                  Colors.teal.shade100,
                  Colors.teal,
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
                  Icons.sentiment_satisfied,
                  Colors.indigo.shade100,
                  Colors.indigo,
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
                  Icons.track_changes,
                  Colors.deepPurple.shade100,
                  Colors.deepPurple,
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
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: iconColor),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
