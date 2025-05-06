import 'package:awwao/data/learning_content.dart';
import 'package:flutter/material.dart';

final List<Color> cardColors = [
  Colors.red.shade300,
  Colors.orange.shade300,
  const Color(0xFF0CA062),
  const Color(0xFF6251F7),
  Colors.blue.shade300,
  Colors.indigo.shade300,
  Colors.purple.shade300,
];

final List<IconData> dayIcons = [
  Icons.mosque_outlined,
  Icons.weekend_outlined,
  Icons.wb_sunny_outlined,
  Icons.school_outlined,
  Icons.sports_soccer_outlined,
  Icons.book_outlined,
  Icons.playlist_add_check_outlined,
];
final data = BanglaLearningData.weekDays;

class BanglaWeek extends StatefulWidget {
  const BanglaWeek({super.key});

  @override
  State<BanglaWeek> createState() => _BanglaWeekState();
}

class _BanglaWeekState extends State<BanglaWeek>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'সপ্তাহ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF9C27B0),
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple.shade50, Colors.white],
          ),
        ),
        child: Column(children: [Expanded(child: _buildDaysList())]),
      ),
    );
  }

  Widget _buildDaysList() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _buildDayCard(index);
        },
      ),
    );
  }

  Widget _buildDayCard(int index) {
    return GestureDetector(
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: cardColors[index],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(dayIcons[index], size: 50, color: Colors.white),
            const SizedBox(height: 12),
            Text(
              data[index]['day']!,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              data[index]['english']!,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
