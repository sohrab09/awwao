import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// মেইন ক্যাটাগরি মডেল
class Categories {
  final int id;
  final String name;
  final IconData icon;
  final String category;
  final List<SubCategory> subCategories;
  final bool hasSound;

  Categories({
    required this.id,
    required this.name,
    required this.icon,
    required this.category,
    required this.subCategories,
    this.hasSound = false,
  });
}

// সাব ক্যাটাগরি মডেল
class SubCategory {
  final String name;
  final String imageUrl;
  final String habitat;
  final String foodHabit;
  // multiple image urls can be added in future
  final List<String> imageUrls;

  SubCategory({
    required this.name,
    required this.imageUrl,
    required this.habitat,
    required this.foodHabit,
    this.imageUrls = const [],
  });
}

// ডেমো ডাটা
List<Categories> categories = [
  Categories(
    id: 1,
    name: "পাখি",
    category: "bird",
    icon: FontAwesomeIcons.dove,
    hasSound: true,
    subCategories: [
      SubCategory(
        name: "কাক",
        imageUrl: "assets/images/crow.jpg",
        habitat: "শহর, গ্রাম",
        foodHabit: "সর্বভুক",
        imageUrls: [
          "assets/images/crow1.jpg",
          "assets/images/crow2.jpg",
          "assets/images/crow3.jpg",
        ],
      ),
      SubCategory(
        name: "দোয়েল",
        imageUrl: "assets/images/doel.jpg",
        habitat: "বন, বাগান",
        foodHabit: "পোকামাকড়",
        imageUrls: List.empty(growable: true),
      ),
    ],
  ),
  Categories(
    id: 2,
    name: "প্রাণী",
    category: "animal",
    icon: Icons.pets,
    hasSound: true,
    subCategories: [
      SubCategory(
        name: "বাঘ",
        imageUrl: "https://example.com/tiger.jpg",
        habitat: "জঙ্গল",
        foodHabit: "মাংসভোজী",
        imageUrls: List.empty(growable: true),
      ),
      SubCategory(
        name: "হাতি",
        imageUrl: "https://example.com/elephant.jpg",
        habitat: "জঙ্গল, বন",
        foodHabit: "তৃণভোজী",
        imageUrls: List.empty(growable: true),
      ),
    ],
  ),
  Categories(
    id: 3,
    name: "মাছ",
    category: "fish",
    icon: FontAwesomeIcons.fish,
    hasSound: false,
    subCategories: [
      SubCategory(
        name: "ইলিশ",
        imageUrl: "https://example.com/ilish.jpg",
        habitat: "নদী, সাগর",
        foodHabit: "শৈবাল ও ছোট প্রাণী",
        imageUrls: List.empty(growable: true),
      ),
      SubCategory(
        name: "রুই মাছ",
        imageUrl: "https://example.com/ruifish.jpg",
        habitat: "পুকুর, নদী",
        foodHabit: "শৈবাল ও উদ্ভিদ",
        imageUrls: List.empty(growable: true),
      ),
    ],
  ),
  Categories(
    id: 4,
    name: "গাছ",
    category: "plant",
    icon: Icons.grass,
    hasSound: false,
    subCategories: [
      SubCategory(
        name: "আম গাছ",
        imageUrl: "https://example.com/mango-tree.jpg",
        habitat: "বাগান, গ্রাম",
        foodHabit: "সূর্যের আলো ও মাটি থেকে খনিজ পদার্থ",
        imageUrls: List.empty(growable: true),
      ),
      SubCategory(
        name: "কাঁঠাল গাছ",
        imageUrl: "https://example.com/jackfruit-tree.jpg",
        habitat: "গ্রামাঞ্চল",
        foodHabit: "সূর্যের আলো ও পানি",
        imageUrls: List.empty(growable: true),
      ),
    ],
  ),
];
