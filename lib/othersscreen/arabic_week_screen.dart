import 'package:flutter/material.dart';

void main() {
  runApp(const WeekdaysApp());
}

class WeekdaysApp extends StatelessWidget {
  const WeekdaysApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weekdays for Kids',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Comic Sans MS',
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
          accentColor: Colors.orange,
          backgroundColor: Colors.yellow.shade50,
          brightness: Brightness.light,
        ),
      ),
      home: const WeekdaysScreen(),
    );
  }
}

class WeekdaysScreen extends StatefulWidget {
  const WeekdaysScreen({super.key});

  @override
  State<WeekdaysScreen> createState() => _WeekdaysScreenState();
}

class _WeekdaysScreenState extends State<WeekdaysScreen>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int _currentIndex = 0;

  // Weekday theme colors for each day
  final List<Color> dayColors = [
    Colors.red.shade300, // Sunday
    Colors.yellow.shade300, // Monday
    Colors.pink.shade300, // Tuesday
    Colors.green.shade300, // Wednesday
    Colors.purple.shade300, // Thursday
    Colors.blue.shade300, // Friday
    Colors.orange.shade300, // Saturday
  ];

  // Weekday icons for each day
  final List<IconData> dayIcons = [
    Icons.wb_sunny, // Sunday - Sun
    Icons.emoji_emotions, // Monday - Happy face
    Icons.pets, // Tuesday - Animal
    Icons.emoji_nature, // Wednesday - Nature
    Icons.star, // Thursday - Star
    Icons.mosque, // Friday - Islamic day of worship
    Icons.sports_basketball, // Saturday - Play
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // আরবী সপ্তাহের দিনগুলি
  final List<Map<String, String>> weekdays = [
    {
      'arabic': 'الأحَد',
      'bangla': 'রবিবার',
      'transliteration': 'Al-Ahad',
      'english': 'Sunday',
      'pronounce': 'al-ah-had',
    },
    {
      'arabic': 'الإثنين',
      'bangla': 'সোমবার',
      'transliteration': 'Al-Ithnayn',
      'english': 'Monday',
      'pronounce': 'al-ith-nayn',
    },
    {
      'arabic': 'الثُّلَاثاء',
      'bangla': 'মঙ্গলবার',
      'transliteration': 'Ath-Thulatha',
      'english': 'Tuesday',
      'pronounce': 'ath-thu-la-tha',
    },
    {
      'arabic': 'الأربعاء',
      'bangla': 'বুধবার',
      'transliteration': 'Al-Arbi\'a',
      'english': 'Wednesday',
      'pronounce': 'al-ar-bi-a',
    },
    {
      'arabic': 'الخَمِيس',
      'bangla': 'বৃহস্পতিবার',
      'transliteration': 'Al-Khamis',
      'english': 'Thursday',
      'pronounce': 'al-kha-mis',
    },
    {
      'arabic': 'الجُمُعَة',
      'bangla': 'শুক্রবার',
      'transliteration': 'Al-Jumu\'ah',
      'english': 'Friday',
      'pronounce': 'al-ju-mu-ah',
    },
    {
      'arabic': 'السَّبْت',
      'bangla': 'শনিবার',
      'transliteration': 'As-Sabt',
      'english': 'Saturday',
      'pronounce': 'as-sabt',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: const Text(
          'আরবী সপ্তাহ',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.white),
            onPressed: () {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: const Text('How to Use'),
                      content: const Text(
                        'Swipe left or right to see different days of the week.\n\n'
                        'Learn the weekdays in Arabic, Bengali, and English!',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Day indicator row
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                weekdays.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 12,
                  width: _currentIndex == index ? 24 : 12,
                  decoration: BoxDecoration(
                    color:
                        _currentIndex == index
                            ? dayColors[index]
                            : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
          ),

          // Main content
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: weekdays.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final day = weekdays[index];
                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    double value = 1.0;
                    if (_pageController.position.haveDimensions) {
                      value = _pageController.page! - index;
                      value = (1 - (value.abs() * 0.3)).clamp(0.85, 1.0);
                    }
                    return Transform.scale(scale: value, child: child);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: dayColors[index].withOpacity(0.5),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Stack(
                        children: [
                          // Background color with pattern
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                color: dayColors[index].withOpacity(0.2),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: CustomPaint(
                                painter: DotPatternPainter(
                                  color: dayColors[index].withOpacity(0.2),
                                ),
                              ),
                            ),
                          ),

                          // Card content
                          Column(
                            children: [
                              // Day header with background
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                decoration: BoxDecoration(
                                  color: dayColors[index],
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(24),
                                    bottomRight: Radius.circular(24),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    // Day icon
                                    Icon(
                                      dayIcons[index],
                                      size: 60,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(height: 8),
                                    // English day name
                                    Text(
                                      day['english']!,
                                      style: const TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      // Bengali day name
                                      LanguageRow(
                                        label: 'Bengali',
                                        text: day['bangla']!,
                                        textStyle: const TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      // Arabic day name
                                      LanguageRow(
                                        label: 'Arabic',
                                        text: day['arabic']!,
                                        textStyle: const TextStyle(
                                          fontSize: 30,
                                          fontFamily: 'Amiri',
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textDirection: TextDirection.rtl,
                                      ),

                                      // Transliteration
                                      LanguageRow(
                                        label: 'Sounds like',
                                        text: day['pronounce']!,
                                        textStyle: TextStyle(
                                          fontSize: 22,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Navigation buttons
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavigationButton(
                  icon: Icons.arrow_back_rounded,
                  onPressed:
                      _currentIndex > 0
                          ? () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                          : null,
                ),
                NavigationButton(
                  icon: Icons.arrow_forward_rounded,
                  onPressed:
                      _currentIndex < weekdays.length - 1
                          ? () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                          : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LanguageRow extends StatelessWidget {
  final String label;
  final String text;
  final TextStyle textStyle;
  final TextDirection? textDirection;

  const LanguageRow({
    super.key,
    required this.label,
    required this.text,
    required this.textStyle,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Directionality(
            textDirection: textDirection ?? TextDirection.ltr,
            child: Text(text, style: textStyle, textAlign: TextAlign.center),
          ),
        ),
      ],
    );
  }
}

class NavigationButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const NavigationButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            onPressed != null ? Colors.blue.shade400 : Colors.grey.shade300,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
        elevation: onPressed != null ? 4 : 0,
      ),
      child: Icon(icon, size: 32),
    );
  }
}

class DotPatternPainter extends CustomPainter {
  final Color color;

  DotPatternPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final dotSize = 4.0;
    final spacing = 20.0;
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), dotSize, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
