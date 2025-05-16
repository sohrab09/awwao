import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ArabicNumbersScreen extends StatefulWidget {
  const ArabicNumbersScreen({super.key});

  @override
  State<ArabicNumbersScreen> createState() => _KidsArabicNumbersScreenState();
}

class _KidsArabicNumbersScreenState extends State<ArabicNumbersScreen>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animationController;
  int _currentPage = 0;
  bool _isAnimating = false;

  // Define vibrant kid-friendly colors
  final List<Color> _backgroundColors = [
    const Color(0xFFFFF9C4), // Light Yellow
    const Color(0xFFE1F5FE), // Light Blue
    const Color(0xFFE8F5E9), // Light Green
    const Color(0xFFF8BBD0), // Pink
    const Color(0xFFE0F7FA), // Light Cyan
    const Color(0xFFF3E5F5), // Light Purple
    const Color(0xFFFFECB3), // Light Amber
    const Color(0xFFE8EAF6), // Light Indigo
    const Color(0xFFFFCCBC), // Light Deep Orange
    const Color(0xFFE1BEE7), // Light Purple
    const Color(0xFFDCEDC8), // Light Light Green
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _pageController.addListener(() {
      int nextPage = _pageController.page!.round();
      if (_currentPage != nextPage) {
        setState(() {
          _currentPage = nextPage;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _playHapticFeedback() {
    HapticFeedback.mediumImpact();
  }

  void _animateNumber() {
    if (!_isAnimating) {
      setState(() {
        _isAnimating = true;
      });
      _animationController.forward(from: 0.0).then((_) {
        setState(() {
          _isAnimating = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // আরবী সংখ্যা এবং তার উচ্চারণ
    final List<Map<String, String>> arabicNumbers = [
      {
        'number': '٠',
        'arabic': 'صِفْر',
        'bangla': 'শূন্য',
        'transliteration': 'Sifr',
        'english': 'Zero',
        'intValue': '0',
      },
      {
        'number': '١',
        'arabic': 'وَاحِد',
        'bangla': 'এক',
        'transliteration': 'Wahid',
        'english': 'One',
        'intValue': '1',
      },
      {
        'number': '٢',
        'arabic': 'إِثْنَان',
        'bangla': 'দুই',
        'transliteration': 'Ithnan',
        'english': 'Two',
        'intValue': '2',
      },
      {
        'number': '٣',
        'arabic': 'ثَلَاثَة',
        'bangla': 'তিন',
        'transliteration': 'Thalatha',
        'english': 'Three',
        'intValue': '3',
      },
      {
        'number': '٤',
        'arabic': 'أَرْبَعَة',
        'bangla': 'চার',
        'transliteration': 'Arba\'a',
        'english': 'Four',
        'intValue': '4',
      },
      {
        'number': '٥',
        'arabic': 'خَمْسَة',
        'bangla': 'পাঁচ',
        'transliteration': 'Khamsa',
        'english': 'Five',
        'intValue': '5',
      },
      {
        'number': '٦',
        'arabic': 'سِتَّة',
        'bangla': 'ছয়',
        'transliteration': 'Sitta',
        'english': 'Six',
        'intValue': '6',
      },
      {
        'number': '٧',
        'arabic': 'سَبْعَة',
        'bangla': 'সাত',
        'transliteration': 'Sab\'a',
        'english': 'Seven',
        'intValue': '7',
      },
      {
        'number': '٨',
        'arabic': 'ثَمَانِيَة',
        'bangla': 'আট',
        'transliteration': 'Thamaniya',
        'english': 'Eight',
        'intValue': '8',
      },
      {
        'number': '٩',
        'arabic': 'تِسْعَة',
        'bangla': 'নয়',
        'transliteration': 'Tis\'a',
        'english': 'Nine',
        'intValue': '9',
      },
      {
        'number': '١٠',
        'arabic': 'عَشَرَة',
        'bangla': 'দশ',
        'transliteration': 'Ashara',
        'english': 'Ten',
        'intValue': '10',
      },
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'আরবী সংখ্যা শিখি',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.indigo.shade800,
            shadows: [
              Shadow(
                offset: const Offset(1, 1),
                blurRadius: 3.0,
                color: Colors.white.withOpacity(0.5),
              ),
            ],
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.indigo.shade800),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              _backgroundColors[_currentPage % _backgroundColors.length],
              _backgroundColors[(_currentPage + 1) % _backgroundColors.length]
                  .withOpacity(0.7),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Progress indicator
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: List.generate(arabicNumbers.length, (index) {
                    return Expanded(
                      child: Container(
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color:
                              _currentPage == index
                                  ? Colors.indigo
                                  : Colors.indigo.withOpacity(0.2),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 20),
              // Main content
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: arabicNumbers.length,
                  onPageChanged: (int page) {
                    _playHapticFeedback();
                  },
                  itemBuilder: (context, index) {
                    final number = arabicNumbers[index];
                    return GestureDetector(
                      onTap: _animateNumber,
                      child: NumberCard(
                        number: number,
                        isAnimating: _isAnimating && _currentPage == index,
                        animation: _animationController,
                        color:
                            _backgroundColors[index % _backgroundColors.length],
                      ),
                    );
                  },
                ),
              ),
              // Navigation controls
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NavigationButton(
                      icon: Icons.arrow_back_rounded,
                      onPressed:
                          _currentPage > 0
                              ? () {
                                _pageController.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              }
                              : null,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '${_currentPage + 1}/${arabicNumbers.length}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                    NavigationButton(
                      icon: Icons.arrow_forward_rounded,
                      onPressed:
                          _currentPage < arabicNumbers.length - 1
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
        ),
      ),
    );
  }
}

class NumberCard extends StatelessWidget {
  final Map<String, String> number;
  final bool isAnimating;
  final AnimationController animation;
  final Color color;

  const NumberCard({
    super.key,
    required this.number,
    required this.isAnimating,
    required this.animation,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: Colors.indigo.shade200, width: 2),
      ),
      color: Colors.white.withOpacity(0.9),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Number display
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: isAnimating ? 1.0 + (animation.value * 0.2) : 1.0,
                  child: Container(
                    width: 190,
                    height: 190,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [color.withOpacity(0.7), color],
                        radius: 0.8,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        number['number']!,
                        style: TextStyle(
                          fontSize: 80,
                          fontFamily: 'Amiri',
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo.shade900,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
            // Arabic text
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              decoration: BoxDecoration(
                color: color.withOpacity(0.3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                number['arabic']!,
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Amiri',
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo.shade900,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            const SizedBox(height: 30),
            // Bangla and transliteration
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberInfoBubble(
                  title: 'বাংলা',
                  value: number['bangla']!,
                  color: Colors.indigo.shade100,
                ),
                const SizedBox(width: 16),
                NumberInfoBubble(
                  title: 'Pronunciation',
                  value: number['transliteration']!,
                  color: Colors.pink.shade100,
                ),
                const SizedBox(width: 16),
                NumberInfoBubble(
                  title: 'English',
                  value: number['english']!,
                  color: Colors.purple.shade100,
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Visual representation using shapes
            VisualCounter(count: int.parse(number['intValue']!)),
          ],
        ),
      ),
    );
  }
}

class NumberInfoBubble extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const NumberInfoBubble({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.indigo.shade800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.indigo.shade900,
            ),
          ),
        ],
      ),
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
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
        backgroundColor:
            onPressed == null ? Colors.grey.shade300 : Colors.indigo.shade600,
        elevation: onPressed == null ? 0 : 8,
      ),
      child: Icon(
        icon,
        size: 32,
        color: onPressed == null ? Colors.grey.shade500 : Colors.white,
      ),
    );
  }
}

class VisualCounter extends StatelessWidget {
  final int count;

  const VisualCounter({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    // For zero, we show an empty circle
    if (count == 0) {
      return Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.indigo.shade300,
            width: 3,
            style: BorderStyle.solid,
          ),
        ),
        child: Center(
          child: Text(
            "Empty",
            style: TextStyle(fontSize: 16, color: Colors.indigo.shade300),
          ),
        ),
      );
    }

    // For numbers 1-10, show visual representation
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: List.generate(count, (index) {
        // Different shapes for visual interest
        final shape = index % 3;
        final color =
            [
              Colors.red.shade300,
              Colors.blue.shade300,
              Colors.green.shade300,
              Colors.orange.shade300,
              Colors.purple.shade300,
            ][index % 5];

        return Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: color,
            shape: shape == 0 ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: shape == 2 ? BorderRadius.circular(8) : null,
            border: Border.all(color: Colors.white, width: 2),
          ),
        );
      }),
    );
  }
}
