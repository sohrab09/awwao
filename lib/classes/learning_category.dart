import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Define the MainCategory class
class MainCategory {
  final String title;
  final String description;
  final String icon;
  final Color color;
  final int position;
  final List<SubCategory> subCategories;

  MainCategory({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.position,
    required this.subCategories,
  });
}

// Define the SubCategory class
class SubCategory {
  final String title;
  final String description;
  final String icon;
  final Color color;
  final String route;
  final int position;

  SubCategory({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.route,
    required this.position,
  });
}

// Main categories list
List<MainCategory> mainCategories = [
  // 1. Animal Category
  MainCategory(
    title: 'প্রাণী জগত',
    description: 'জানি প্রাণী জগতের বিভিন্ন সদস্য',
    icon: 'assets/icons/animals.png',
    color: const Color(0xFF9C27B0), // Purple 500
    position: 1,
    subCategories: [
      SubCategory(
        title: 'পাখি',
        description: 'বিভিন্ন পাখি চিনি',
        icon: 'assets/icons/bird.png',
        color: const Color(0xFFF44336), // Red 500
        route: '/birds',
        position: 1,
      ),
      SubCategory(
        title: 'প্রাণী',
        description: 'জানি প্রাণী জগত',
        icon: 'assets/icons/animal.png',
        color: const Color(0xFF9C27B0), // Purple 500
        route: '/animals',
        position: 2,
      ),
      SubCategory(
        title: 'মাছ',
        description: 'মাছের রাজ্য',
        icon: 'assets/icons/fish.png',
        color: const Color(0xFFE91E63), // Pink 500
        route: '/fish',
        position: 3,
      ),
    ],
  ),

  // 2. Plant Category
  MainCategory(
    title: 'উদ্ভিদ জগত',
    description: 'উদ্ভিদ জগতের সাথে পরিচয়',
    icon: 'assets/icons/plants.png',
    color: const Color(0xFF4CAF50), // Green 500
    position: 2,
    subCategories: [
      SubCategory(
        title: 'গাছ',
        description: 'গাছের সাথে বন্ধুত্ব',
        icon: 'assets/icons/tree.png',
        color: const Color(0xFF4CAF50), // Green 500
        route: '/trees',
        position: 1,
      ),
      SubCategory(
        title: 'ফুল',
        description: 'রঙিন ফুলের রাজ্য',
        icon: 'assets/icons/flower.png',
        color: const Color(0xFFFFC107), // Amber 500
        route: '/flowers',
        position: 2,
      ),
      SubCategory(
        title: 'ফল',
        description: 'সুস্বাদু ফলের পরিচয়',
        icon: 'assets/icons/fruits.png',
        color: const Color(0xFFFF5722), // Deep Orange 500
        route: '/fruits',
        position: 3,
      ),
    ],
  ),

  // 3. Language Learning Category
  MainCategory(
    title: 'ভাষা শিক্ষা',
    description: 'বিভিন্ন ভাষা ও বিষয় শিখি',
    icon: 'assets/icons/languages.png',
    color: const Color(0xFF00BCD4), // Cyan 500
    position: 3,
    subCategories: [
      SubCategory(
        title: 'বাংলা',
        description: 'এসো বাংলা শিখি',
        icon: 'assets/icons/vowels.png',
        color: const Color(0xFF00BCD4), // Cyan 500
        route: '/bangla',
        position: 1,
      ),
      SubCategory(
        title: 'ইংরেজি',
        description: 'এসো ইংরেজি শিখি',
        icon: 'assets/icons/english.png',
        color: const Color(0xFFE91E63), // Pink 500
        route: '/english',
        position: 2,
      ),
      SubCategory(
        title: 'অংক',
        description: 'অংক শিখি খেলতে খেলতে',
        icon: 'assets/icons/math.png',
        color: const Color(0xFF607D8B), // Blue Grey 500
        route: '/math',
        position: 3,
      ),
      SubCategory(
        title: 'আরবি',
        description: 'এসো আরবি শিখি',
        icon: 'assets/icons/arabic.png',
        color: const Color(0xFF795548), // Brown 500
        route: '/arabic',
        position: 4,
      ),
    ],
  ),
];
