import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islamic Months for Kids',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Comic Sans MS',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MonthsScreen(),
    );
  }
}

class MonthsScreen extends StatefulWidget {
  const MonthsScreen({super.key});

  @override
  State<MonthsScreen> createState() => _MonthsScreenState();
}

class _MonthsScreenState extends State<MonthsScreen>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int _currentIndex = 0;

  final List<Color> _backgroundColors = [
    const Color(0xFFC8E6C9), // Light Green
    const Color(0xFFFFCCBC), // Light Orange
    const Color(0xFFBBDEFB), // Light Blue
    const Color(0xFFE1BEE7), // Light Purple
    const Color(0xFFF8BBD0), // Light Pink
    const Color(0xFFD1C4E9), // Light Deep Purple
    const Color(0xFFFFECB3), // Light Amber
    const Color(0xFFB2DFDB), // Light Teal
    const Color(0xFFFFCDD2), // Light Red
    const Color(0xFFB3E5FC), // Light Light Blue
    const Color(0xFFDCEDC8), // Light Light Green
    const Color(0xFFFFE0B2), // Light Orange
  ];

  // Islamic month images (placeholder URLs)
  final List<String> _monthIcons = [
    '🌙', // Muharram - Crescent moon
    '🕌', // Safar - Mosque
    '🎂', // Rabi' al-Awwal - Birthday cake (Prophet's birthday)
    '🌷', // Rabi' al-Thani - Flower
    '☀️', // Jumada al-Ula - Sun
    '🌈', // Jumada al-Akhirah - Rainbow
    '🌟', // Rajab - Star
    '🌾', // Sha'ban - Wheat
    '🍽️', // Ramadan - Food plate
    '🎉', // Shawwal - Celebration
    '🐪', // Dhu al-Qa'dah - Camel
    '✨', // Dhu al-Hijjah - Sparkles
  ];

  final List<String> _moonPhases = [
    '🌑',
    '🌒',
    '🌓',
    '🌔',
    '🌕',
    '🌖',
    '🌗',
    '🌘',
    '🌑',
    '🌒',
    '🌓',
    '🌔',
  ];

  // Islamic months data
  final List<Map<String, String>> islamicMonths = [
    {
      'arabic': 'مُحَرَّم',
      'bangla': 'মুহাররম',
      'transliteration': 'Muharram',
      'fun_fact': 'The first month of the Islamic calendar!',
    },
    {
      'arabic': 'صَفَر',
      'bangla': 'সফর',
      'transliteration': 'Safar',
      'fun_fact': 'The second month means "empty" or "yellow"!',
    },
    {
      'arabic': 'رَبِيع الأَوَّل',
      'bangla': 'রবিউল আউয়াল',
      'transliteration': 'Rabi\' al-Awwal',
      'fun_fact':
          'The month when Prophet Muhammad (peace be upon him) was born!',
    },
    {
      'arabic': 'رَبِيع الثَّانِي',
      'bangla': 'রবিউস সানি',
      'transliteration': 'Rabi\' al-Thani',
      'fun_fact': 'The name means "second spring"!',
    },
    {
      'arabic': 'جُمَادَى الأُولَى',
      'bangla': 'জুমাদাল উলা',
      'transliteration': 'Jumada al-Ula',
      'fun_fact': 'The name relates to "freezing" or "dry land"!',
    },
    {
      'arabic': 'جُمَادَى الآخِرَة',
      'bangla': 'জুমাদাস সানি',
      'transliteration': 'Jumada al-Akhirah',
      'fun_fact': 'The last "dry" month of the year!',
    },
    {
      'arabic': 'رَجَب',
      'bangla': 'রজব',
      'transliteration': 'Rajab',
      'fun_fact': 'A sacred month when fighting was forbidden!',
    },
    {
      'arabic': 'شَعْبَان',
      'bangla': 'শাবান',
      'transliteration': 'Sha\'ban',
      'fun_fact': 'The month of "branching out" before Ramadan!',
    },
    {
      'arabic': 'رَمَضَان',
      'bangla': 'রমজান',
      'transliteration': 'Ramadan',
      'fun_fact': 'The month of fasting and the Quran!',
    },
    {
      'arabic': 'شَوَّال',
      'bangla': 'শাওয়াল',
      'transliteration': 'Shawwal',
      'fun_fact': 'The month of Eid al-Fitr celebration!',
    },
    {
      'arabic': 'ذُو القَعْدَة',
      'bangla': 'জিলকদ',
      'transliteration': 'Dhu al-Qa\'dah',
      'fun_fact': 'A sacred month when people would "sit down" from fighting!',
    },
    {
      'arabic': 'ذُو الحِجَّة',
      'bangla': 'জিলহজ',
      'transliteration': 'Dhu al-Hijjah',
      'fun_fact': 'The month of Hajj pilgrimage and Eid al-Adha!',
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85, initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Islamic Months',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 3.0,
                color: Color(0xFF000000),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              _backgroundColors[_currentIndex],
              _backgroundColors[_currentIndex].withOpacity(0.6),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Moon phases indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  islamicMonths.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Text(
                      _currentIndex == index ? _moonPhases[index] : '•',
                      style: TextStyle(
                        fontSize: _currentIndex == index ? 24 : 20,
                        color: _currentIndex == index ? null : Colors.black38,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Month cards
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemCount: islamicMonths.length,
                  itemBuilder: (context, index) {
                    final month = islamicMonths[index];
                    return _buildMonthCard(month, index);
                  },
                ),
              ),

              // Navigation buttons
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavButton(
                      icon: Icons.arrow_back_ios_rounded,
                      onPressed: () {
                        if (_currentIndex > 0) {
                          _pageController.animateToPage(
                            _currentIndex - 1,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        "${_currentIndex + 1}/${islamicMonths.length}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _buildNavButton(
                      icon: Icons.arrow_forward_ios_rounded,
                      onPressed: () {
                        if (_currentIndex < islamicMonths.length - 1) {
                          _pageController.animateToPage(
                            _currentIndex + 1,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMonthCard(Map<String, String> month, int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Month number banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              color: _getMonthColor(index).withOpacity(0.3),
              child: Center(
                child: Text(
                  'Month ${index + 1} of 12',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: _getMonthColor(index),
                  ),
                ),
              ),
            ),

            // Month icon
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                _monthIcons[index],
                style: const TextStyle(fontSize: 60),
              ),
            ),

            // Bangla name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                month['bangla']!,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Arabic name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                month['arabic']!,
                style: const TextStyle(
                  fontSize: 34,
                  fontFamily: 'Amiri',
                  color: Colors.indigo,
                ),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            ),

            // Transliteration
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                month['transliteration']!,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey.shade700,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Fun fact box
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _getMonthColor(index).withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: _getMonthColor(index).withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.lightbulb_outline,
                    size: 28,
                    color: Colors.amber,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      month['fun_fact']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.teal,
        padding: const EdgeInsets.all(16),
        shape: const CircleBorder(),
        elevation: 4,
      ),
      child: Icon(icon, size: 24),
    );
  }

  Color _getMonthColor(int index) {
    final colors = [
      Colors.teal,
      Colors.orange,
      Colors.blue,
      Colors.purple,
      Colors.pink,
      Colors.deepPurple,
      Colors.amber,
      Colors.lightBlue,
      Colors.red,
      Colors.green,
      Colors.brown,
      Colors.indigo,
    ];
    return colors[index % colors.length];
  }
}
