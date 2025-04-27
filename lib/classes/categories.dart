import 'package:flutter/material.dart';

// Category Model
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

// SubCategory Model
class SubCategory {
  final String name;
  final String imageUrl;
  final String habitat;
  final String foodHabit;
  final List<String> imageUrls;
  final String? sound;
  final String? description;

  SubCategory({
    required this.name,
    required this.imageUrl,
    required this.habitat,
    required this.foodHabit,
    this.imageUrls = const [],
    this.sound,
    this.description,
  });
}
