import 'package:flutter/material.dart';

class BanglaSeason extends StatelessWidget {
  static final List<Map<String, dynamic>> seasons = [
    {
      'name': 'গ্রীষ্ম',
      'english': 'Summer',
      'months': ['বৈশাখ', 'জ্যৈষ্ঠ'],
      'description': 'বছরের সবচেয়ে গরমকাল। তাপমাত্রা খুব বেশি থাকে।',
      'image': 'assets/images/summer.jpg',
      'color': Colors.orange,
    },
    {
      'name': 'বর্ষা',
      'english': 'Rainy Season',
      'months': ['আষাঢ়', 'শ্রাবণ'],
      'description': 'প্রচুর বৃষ্টি ও বন্যা হয়। চারদিকে সবুজ দেখা যায়।',
      'image': 'assets/images/rainy.jpg',
      'color': Colors.green,
    },
    {
      'name': 'শরৎ',
      'english': 'Autumn',
      'months': ['ভাদ্র', 'আশ্বিন'],
      'description': 'শিশির পড়া শুরু হয়। আকাশে সাদা মেঘ দেখা যায়।',
      'image': 'assets/images/autumn.jpg',
      'color': Colors.deepOrange,
    },
    {
      'name': 'হেমন্ত',
      'english': 'Late Autumn',
      'months': ['কার্তিক', 'অগ্রহায়ন'],
      'description': 'সকালে কুয়াশা থাকে। ফসল ঘরে তোলার সময়।',
      'image': 'assets/images/late_autumn.jpg',
      'color': Colors.brown,
    },
    {
      'name': 'শীত',
      'english': 'Winter',
      'months': ['পৌষ', 'মাঘ'],
      'description': 'বছরের সবচেয়ে ঠান্ডা সময়। কুয়াশা ও শীতের প্রকোপ বেশি।',
      'image': 'assets/images/winter.jpg',
      'color': Colors.blue,
    },
    {
      'name': 'বসন্ত',
      'english': 'Spring',
      'months': ['ফাল্গুন', 'চৈত্র'],
      'description': 'প্রকৃতি নতুন রূপ ধারণ করে। গাছে নতুন পাতা ও ফুল ফোটে।',
      'image': 'assets/images/spring.jpg',
      'color': Colors.pink,
    },
  ];

  const BanglaSeason({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'বাংলা ঋতু',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        backgroundColor: const Color(0xFF00BCD4),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE0F7FA), Colors.white],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: seasons.length,
                itemBuilder: (context, index) {
                  final season = seasons[index];
                  return SeasonCard(season: season);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SeasonCard extends StatelessWidget {
  final Map<String, dynamic> season;

  const SeasonCard({super.key, required this.season});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SeasonDetailsScreen(season: season),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                season['color'].withOpacity(0.8),
                season['color'].withOpacity(0.5),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _getSeasonIcon(season['name']),
                  size: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                season['name'],
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                season['english'],
                style: const TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 4,
                children: [
                  for (final month in season['months'])
                    Chip(
                      label: Text(month, style: const TextStyle(fontSize: 12)),
                      backgroundColor: Colors.white.withOpacity(0.3),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getSeasonIcon(String name) {
    switch (name) {
      case 'গ্রীষ্ম':
        return Icons.wb_sunny;
      case 'বর্ষা':
        return Icons.umbrella;
      case 'শরৎ':
        return Icons.cloud;
      case 'হেমন্ত':
        return Icons.grain;
      case 'শীত':
        return Icons.ac_unit;
      case 'বসন্ত':
        return Icons.spa;
      default:
        return Icons.nature;
    }
  }
}

class SeasonDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> season;

  const SeasonDetailsScreen({super.key, required this.season});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(season['name']),
        backgroundColor: season['color'],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [season['color'].withOpacity(0.2), Colors.white],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Hero(
                tag: season['name'],
                child: Container(
                  // height: 150,
                  decoration: BoxDecoration(
                    color: season['color'].withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        season['image'],
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        'বর্ণনা',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: season['color'],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        season['description'],
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        'মাস',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: season['color'],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (final month in season['months'])
                            Chip(
                              label: Text(
                                month,
                                style: const TextStyle(fontSize: 16),
                              ),
                              backgroundColor: season['color'],
                              labelStyle: const TextStyle(color: Colors.white),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add fun activity for kids
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: season['color'],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                child: const Text(
                  'কার্যক্রম',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
