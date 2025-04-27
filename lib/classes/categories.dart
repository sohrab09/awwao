import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Categories {
  final int id;
  final String name;
  final IconData icon;

  Categories({required this.id, required this.name, required this.icon});
}

List<Categories> categories = [
  Categories(id: 1, name: "পাখি", icon: FontAwesomeIcons.dove),
  Categories(id: 2, name: "প্রাণী", icon: Icons.pets),
  Categories(id: 3, name: "মাছ", icon: FontAwesomeIcons.fish),
  Categories(id: 4, name: "গাছ", icon: Icons.grass),
];
