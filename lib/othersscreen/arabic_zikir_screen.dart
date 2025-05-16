import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

class ZikirScreen extends StatelessWidget {
  const ZikirScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> zikirs = [
      {
        'title': 'সুবহানাল্লাহ',
        'arabic': 'سُبْحَانَ اللهِ',
        'bangla': 'সুবহানাল্লাহ',
        'meaning': 'আল্লাহ পবিত্র, মহিমান্বিত',
        'count': 33,
        'color': Colors.green.shade100,
      },
      {
        'title': 'আলহামদুলিল্লাহ',
        'arabic': 'الْحَمْدُ لِلَّهِ',
        'bangla': 'আলহামদুলিল্লাহ',
        'meaning': 'সমস্ত প্রশংসা আল্লাহর জন্য',
        'count': 33,
        'color': Colors.blue.shade100,
      },
      {
        'title': 'আল্লাহু আকবার',
        'arabic': 'اللهُ أَكْبَرُ',
        'bangla': 'আল্লাহু আকবার',
        'meaning': 'আল্লাহ সবচেয়ে বড়',
        'count': 34,
        'color': Colors.orange.shade100,
      },
      {
        'title': 'লা ইলাহা ইল্লাল্লাহ',
        'arabic': 'لَا إِلَهَ إِلَّا اللهُ',
        'bangla': 'লা ইলাহা ইল্লাল্লাহ',
        'meaning': 'আল্লাহ ছাড়া কোন উপাস্য নেই',
        'count': 100,
        'color': Colors.purple.shade100,
      },
      {
        'title': 'আস্তাগফিরুল্লাহ',
        'arabic': 'أَسْتَغْفِرُ اللهَ',
        'bangla': 'আস্তাগফিরুল্লাহ',
        'meaning': 'আমি আল্লাহর কাছে ক্ষমা চাই',
        'count': 100,
        'color': Colors.pink.shade100,
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('জিকির সমূহ')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: zikirs.length,
        itemBuilder: (context, index) {
          final zikir = zikirs[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: zikir['color'],
            elevation: 4,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => ZikirCounterScreen(
                          title: zikir['title'],
                          arabic: zikir['arabic'],
                          bangla: zikir['bangla'],
                          meaning: zikir['meaning'],
                          count: zikir['count'],
                          color: zikir['color'],
                        ),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      zikir['title']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        zikir['arabic']!,
                        style: const TextStyle(
                          fontSize: 28,
                          fontFamily: 'Amiri',
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'অর্থ: ${zikir['meaning']!}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'নির্ধারিত সংখ্যা: ${zikir['count']}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ZikirCounterScreen extends StatefulWidget {
  final String title;
  final String arabic;
  final String bangla;
  final String meaning;
  final int count;
  final Color color;

  const ZikirCounterScreen({
    Key? key,
    required this.title,
    required this.arabic,
    required this.bangla,
    required this.meaning,
    required this.count,
    required this.color,
  }) : super(key: key);

  @override
  State<ZikirCounterScreen> createState() => _ZikirCounterScreenState();
}

class _ZikirCounterScreenState extends State<ZikirCounterScreen>
    with TickerProviderStateMixin {
  int _counter = 0;
  bool _completed = false;
  late AnimationController _bounceController;
  late AnimationController _rotationController;
  late AnimationController _colorController;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    // For bouncing effect when tapping
    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _bounceController, curve: Curves.elasticOut),
    );

    // For celebration rotation when completed
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // For color transition
    _colorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _colorAnimation = ColorTween(
      begin: widget.color,
      end: Colors.green,
    ).animate(_colorController);
  }

  @override
  void dispose() {
    _bounceController.dispose();
    _rotationController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    if (_counter < widget.count) {
      _bounceController.reset();
      _bounceController.forward();

      setState(() {
        _counter++;
        if (_counter == widget.count) {
          _completed = true;
          _colorController.forward();
          _rotationController.repeat();
          _showCompletionDialog();
        }
      });
    }
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _completed = false;
      _colorController.reverse();
      _rotationController.stop();
      _rotationController.reset();
    });
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'মাশাআল্লাহ! 🎉',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/celebration.png', // Replace with your own asset
                height: 120,
                width: 120,
                errorBuilder:
                    (context, error, stackTrace) => const Icon(
                      Icons.celebration,
                      size: 80,
                      color: Colors.amber,
                    ),
              ),
              const SizedBox(height: 12),
              const Text(
                'আপনি সফলভাবে জিকির সম্পন্ন করেছেন!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'ধন্যবাদ',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, size: 28),
            onPressed: _resetCounter,
            tooltip: 'রিসেট করুন',
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              _completed ? Colors.green.shade500 : widget.color.darker(),
              _completed ? Colors.green.shade300 : widget.color,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top section with Zikir text
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    elevation: 10,
                    shadowColor: Colors.black38,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.white, Colors.grey.shade50],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Arabic Text with decoration
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  _completed
                                      ? Colors.green.withOpacity(0.1)
                                      : widget.color.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              widget.arabic,
                              style: const TextStyle(
                                fontSize: 28,
                                fontFamily: 'Amiri',
                                height: 1.5,
                              ),
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Bangla translation
                          Text(
                            widget.bangla,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              height: 1.3,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),

                          // Meaning with decoration
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                            ),
                            child: Text(
                              widget.meaning,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade800,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Bottom section with counter
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Progress indicator with counter
                      GestureDetector(
                        onTap: _incrementCounter,
                        child: AnimatedBuilder(
                          animation: _scaleAnimation,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: _scaleAnimation.value,
                              child: child,
                            );
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              AnimatedBuilder(
                                animation: _rotationController,
                                builder: (context, child) {
                                  return Transform.rotate(
                                    angle:
                                        _completed
                                            ? _rotationController.value *
                                                2 *
                                                math.pi
                                            : 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                _completed
                                                    ? Colors.green.withOpacity(
                                                      0.5,
                                                    )
                                                    : widget.color.withOpacity(
                                                      0.5,
                                                    ),
                                            blurRadius: 20,
                                            spreadRadius: 5,
                                          ),
                                        ],
                                      ),
                                      child: SizedBox(
                                        height: 180,
                                        width: 180,
                                        child: Stack(
                                          children: [
                                            // Background circle
                                            Container(
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                            ),

                                            // Decorative elements
                                            for (int i = 0; i < 8; i++)
                                              Positioned.fill(
                                                child: Transform.rotate(
                                                  angle: i * math.pi / 4,
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topCenter,
                                                    child: Container(
                                                      height: 20,
                                                      width: 5,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            _completed
                                                                ? Colors
                                                                    .green
                                                                    .shade200
                                                                : widget.color
                                                                    .lighter(),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              10,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),

                                            // Progress circle
                                            AnimatedBuilder(
                                              animation: _colorAnimation,
                                              builder: (context, _) {
                                                return CircularProgressIndicator(
                                                  value:
                                                      _counter / widget.count,
                                                  strokeWidth: 15,
                                                  backgroundColor:
                                                      Colors.grey.shade200,
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                        Color
                                                      >(
                                                        _completed
                                                            ? Colors.green
                                                            : widget.color,
                                                      ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),

                              // Counter number and text
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AnimatedDefaultTextStyle(
                                    duration: const Duration(milliseconds: 300),
                                    style: TextStyle(
                                      fontSize: 52,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          _completed
                                              ? Colors.green
                                              : widget.color,
                                    ),
                                    child: Text(_counter.toString()),
                                  ),
                                  const SizedBox(height: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          _completed
                                              ? Colors.green.shade50
                                              : widget.color.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      'মোট ${widget.count}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            _completed
                                                ? Colors.green.shade700
                                                : widget.color.darker(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Tap button
                      GestureDetector(
                        onTap: _incrementCounter,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors:
                                  _completed
                                      ? [
                                        Colors.green.shade400,
                                        Colors.green.shade600,
                                      ]
                                      : [widget.color, widget.color.darker()],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    _completed
                                        ? Colors.green.withOpacity(0.4)
                                        : widget.color.withOpacity(0.4),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (_completed)
                                const Icon(
                                  Icons.check_circle,
                                  color: Colors.white,
                                  size: 24,
                                )
                              else
                                Icon(
                                  Icons.touch_app,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              const SizedBox(width: 12),
                              Text(
                                _completed
                                    ? 'সম্পন্ন হয়েছে!'
                                    : 'এখানে ট্যাপ করুন',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      if (_completed)
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: TextButton.icon(
                            onPressed: _resetCounter,
                            icon: const Icon(Icons.replay, color: Colors.white),
                            label: const Text(
                              'আবার শুরু করুন',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension ColorExtension on Color {
  Color darker() {
    return HSLColor.fromColor(this)
        .withLightness(
          (HSLColor.fromColor(this).lightness - 0.1).clamp(0.0, 1.0),
        )
        .toColor();
  }

  Color lighter() {
    return HSLColor.fromColor(this)
        .withLightness(
          (HSLColor.fromColor(this).lightness + 0.1).clamp(0.0, 1.0),
        )
        .toColor();
  }
}
