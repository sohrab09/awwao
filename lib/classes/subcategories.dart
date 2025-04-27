import 'package:awwao/classes/categories.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        sound: "assets/sounds/crow.mp3",
        description:
            "কাক একটি সাধারণ পাখি যা শহর ও গ্রামে দেখা যায়। এটি সর্বভুক এবং বিভিন্ন ধরনের খাবার খায়।",
      ),
      SubCategory(
        name: "দোয়েল",
        imageUrl: "assets/images/doel.jpg",
        habitat: "বন, বাগান",
        foodHabit: "পোকামাকড়",
        imageUrls: List.empty(growable: true),
        sound: "assets/sounds/doel.mp3",
        description:
            "দোয়েল একটি সুন্দর পাখি যা সাধারণত বন ও বাগানে দেখা যায়। এটি পোকামাকড় খায় এবং গান গায়।",
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
        sound: "assets/sounds/tiger.mp3",
        description:
            "বাঘ একটি শক্তিশালী শিকারী প্রাণী যা জঙ্গলে বাস করে। এটি মাংসভোজী এবং সাধারণত একাকী থাকে।",
      ),
      SubCategory(
        name: "হাতি",
        imageUrl: "https://example.com/elephant.jpg",
        habitat: "জঙ্গল, বন",
        foodHabit: "তৃণভোজী",
        imageUrls: List.empty(growable: true),
        sound: "assets/sounds/elephant.mp3",
        description:
            "হাতি একটি বৃহৎ তৃণভোজী প্রাণী যা জঙ্গলে ও বনাঞ্চলে বাস করে। এটি সাধারণত দলবদ্ধভাবে থাকে এবং সামাজিক প্রাণী।",
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
        sound: null,
        description:
            "ইলিশ একটি জনপ্রিয় মাছ যা নদী ও সাগরে পাওয়া যায়। এটি শৈবাল ও ছোট প্রাণী খায় এবং বাংলাদেশের জাতীয় মাছ।",
      ),
      SubCategory(
        name: "রুই মাছ",
        imageUrl: "https://example.com/ruifish.jpg",
        habitat: "পুকুর, নদী",
        foodHabit: "শৈবাল ও উদ্ভিদ",
        imageUrls: List.empty(growable: true),
        sound: null,
        description:
            "রুই মাছ একটি জনপ্রিয় তাজা পানির মাছ যা পুকুর ও নদীতে পাওয়া যায়। এটি শৈবাল ও উদ্ভিদ খায়।",
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
        sound: null,
        description:
            "আম গাছ একটি জনপ্রিয় ফলের গাছ যা বাগান ও গ্রামে পাওয়া যায়। এটি সূর্যের আলো ও মাটি থেকে খনিজ পদার্থ গ্রহণ করে।",
      ),
      SubCategory(
        name: "কাঁঠাল গাছ",
        imageUrl: "https://example.com/jackfruit-tree.jpg",
        habitat: "গ্রামাঞ্চল",
        foodHabit: "সূর্যের আলো ও পানি",
        imageUrls: List.empty(growable: true),
        sound: null,
        description:
            "কাঁঠাল গাছ একটি বৃহৎ গাছ যা গ্রামাঞ্চলে পাওয়া যায়। এটি সূর্যের আলো ও পানি গ্রহণ করে এবং কাঁঠাল ফল দেয়।",
      ),
    ],
  ),
  Categories(
    id: 5,
    name: "ফুল",
    category: "flower",
    icon: Icons.local_florist,
    hasSound: false,
    subCategories: [
      SubCategory(
        name: "গোলাপ",
        imageUrl: "https://example.com/rose.jpg",
        habitat: "বাগান, গ্রাম",
        foodHabit: "সূর্যের আলো ও পানি",
        imageUrls: List.empty(growable: true),
        sound: null,
        description:
            "গোলাপ একটি জনপ্রিয় ফুল যা বাগান ও গ্রামে পাওয়া যায়। এটি সূর্যের আলো ও পানি গ্রহণ করে এবং বিভিন্ন রঙের হয়ে থাকে।",
      ),
      SubCategory(
        name: "জবা",
        imageUrl: "https://example.com/jaba.jpg",
        habitat: "বাগান, গ্রাম",
        foodHabit: "সূর্যের আলো ও পানি",
        imageUrls: List.empty(growable: true),
        sound: null,
        description:
            "জবা একটি সুন্দর ফুল যা বাগান ও গ্রামে পাওয়া যায়। এটি সূর্যের আলো ও পানি গ্রহণ করে এবং বিভিন্ন রঙের হয়ে থাকে।",
      ),
    ],
  ),
];
