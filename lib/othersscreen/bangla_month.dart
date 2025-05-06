import 'package:awwao/data/learning_content.dart';
import 'package:flutter/material.dart';

final data = BanglaLearningData.months;

// Seasonal colors for month cards (representing the seasons in Bangladesh)
final List<Color> seasonalColors = [
  Colors.deepOrange,
  Colors.blue,
  Colors.green,
  Colors.pink,
  Colors.deepPurple,
  Colors.amber.shade800,
  Colors.teal,
  Colors.red,
  Colors.orange.shade700,
  Colors.indigo,
  Colors.brown,
  Colors.cyan.shade700,
];

// Icons for months (representing seasonal elements)
final List<IconData> monthIcons = [
  Icons.wb_sunny_outlined,
  Icons.local_florist_outlined,
  Icons.water_drop_outlined,
  Icons.umbrella_outlined,
  Icons.cloudy_snowing,
  Icons.eco_outlined,
  Icons.wind_power_outlined,
  Icons.nest_cam_wired_stand,
  Icons.ac_unit_outlined,
  Icons.nights_stay_outlined,
  Icons.yard_outlined,
  Icons.emoji_nature_outlined,
];

// Seasonal element names for each month
final List<String> seasonalElements = [
  'নববর্ষ',
  'গ্রীষ্মকাল',
  'বর্ষাকাল',
  'বৃষ্টি',
  'মেঘ',
  'শরৎকাল',
  'শিশির',
  'হেমন্তকাল',
  'শীতকাল',
  'কুয়াশা',
  'বসন্তকাল',
  'ফুল',
];

class BanglaMonth extends StatefulWidget {
  const BanglaMonth({super.key});

  @override
  State<BanglaMonth> createState() => _BanglaMonthState();
}

class _BanglaMonthState extends State<BanglaMonth>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'মাস',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFEC1D8F),
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFCE4EC), Colors.white],
          ),
        ),
        child: Column(children: [Expanded(child: _buildMonthsGrid())]),
      ),
    );
  }

  Widget _buildMonthsGrid() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
          childAspectRatio: 1.1,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _buildMonthCard(index);
        },
      ),
    );
  }

  Widget _buildMonthCard(int index) {
    return GestureDetector(
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                seasonalColors[index],
                seasonalColors[index].withOpacity(0.7),
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(monthIcons[index], size: 40, color: Colors.white),
                const SizedBox(height: 8),
                Text(
                  data[index]['bangla']!,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  data[index]['english']!.split(' ').first,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.9),
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
}
