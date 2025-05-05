import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Define the LearningCategory class
class LearningCategory {
  final String title;
  final String description;
  final String icon;
  final Color color;
  final String route;
  final int position;

  LearningCategory({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.route,
    required this.position,
  });
}

List<LearningCategory> learningCategories = [
  LearningCategory(
    title: 'পাখি',
    description: 'বিভিন্ন পাখি চিনি',
    icon: 'assets/icons/bird.png',
    color: const Color(0xFFF44336), // Red 500
    route: '/birds',
    position: 0,
  ),
  LearningCategory(
    title: 'প্রাণী',
    description: 'জানি প্রাণী জগত',
    icon: 'assets/icons/animal.png',
    color: const Color(0xFF9C27B0), // Purple 500
    route: '/animals',
    position: 1,
  ),
  LearningCategory(
    title: 'গাছ',
    description: 'গাছের সাথে বন্ধুত্ব',
    icon: 'assets/icons/tree.png',
    color: const Color(0xFF4CAF50), // Green 500
    route: '/trees',
    position: 2,
  ),
  LearningCategory(
    title: 'ফুল',
    description: 'রঙিন ফুলের রাজ্য',
    icon: 'assets/icons/flower.png',
    color: const Color(0xFFFFC107), // Amber 500
    route: '/flowers',
    position: 3,
  ),
  LearningCategory(
    title: 'ফল',
    description: 'সুস্বাদু ফলের পরিচয়',
    icon: 'assets/icons/fruits.png',
    color: const Color(0xFFFF5722), // Deep Orange 500
    route: '/fruits',
    position: 4,
  ),
  LearningCategory(
    title: 'সংখ্যা',
    description: 'সংখ্যা গণনা শিখি',
    icon: 'assets/icons/numbers.png',
    color: const Color(0xFF2196F3), // Blue 500
    route: '/numbers',
    position: 5,
  ),
  LearningCategory(
    title: 'নামতা',
    description: 'নামতা আবৃত্তি করি',
    icon: 'assets/icons/countdown.png',
    color: const Color(0xFF673AB7), // Deep Purple 500
    route: '/tables',
    position: 6,
  ),
  LearningCategory(
    title: 'স্বরবর্ণ',
    description: 'বাংলা স্বরবর্ণ',
    icon: 'assets/icons/vowels.png',
    color: const Color(0xFF00BCD4), // Cyan 500
    route: '/vowels',
    position: 7,
  ),
  LearningCategory(
    title: 'ব্যঞ্জনবর্ণ',
    description: 'বাংলা ব্যঞ্জনবর্ণ',
    icon: 'assets/icons/consonants.png',
    color: const Color(0xFF795548), // Brown 500
    route: '/consonants',
    position: 8,
  ),
  LearningCategory(
    title: 'অংক',
    description: 'অংক শিখি খেলতে খেলতে',
    icon: 'assets/icons/math.png',
    color: const Color(0xFF607D8B), // Blue Grey 500
    route: '/math',
    position: 9,
  ),
  LearningCategory(
    title: 'আরবী',
    description: 'আরবী বর্ণমালা',
    icon: 'assets/icons/arabic.png',
    color: const Color(0xFF8BC34A), // Light Green 500
    route: '/arabic',
    position: 10,
  ),
  LearningCategory(
    title: 'ইংরেজি',
    description: 'ইংরেজি বর্ণমালা',
    icon: 'assets/icons/english.png',
    color: const Color(0xFFE91E63), // Pink 500
    route: '/english',
    position: 11,
  ),
];
