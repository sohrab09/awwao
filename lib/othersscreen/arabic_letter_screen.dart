import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'package:audioplayers/audioplayers.dart';

class ArabicLettersScreen extends StatefulWidget {
  const ArabicLettersScreen({super.key});

  @override
  State<ArabicLettersScreen> createState() => _ArabicLettersScreenState();
}

class _ArabicLettersScreenState extends State<ArabicLettersScreen>
    with TickerProviderStateMixin {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int? _selectedIndex;
  late AnimationController _bounceController;
  late AnimationController _rotationController;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _bounceAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _bounceController, curve: Curves.easeInOut),
    );

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _bounceController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  // Play letter sound
  Future<void> _playLetterSound(String letter) async {
    // In a real app, you would have actual audio files for each letter
    // For this example, we're assuming you have files like 'alif.mp3', 'ba.mp3', etc.
    String soundFile = 'assets/sounds/${_getAudioFileName(letter)}.mp3';

    try {
      await _audioPlayer.play(AssetSource(soundFile));
    } catch (e) {
      debugPrint('Error playing sound: $e');
      // Fallback to a default sound if specific letter sound is not available
      await _audioPlayer.play(AssetSource('assets/sounds/letter_tap.mp3'));
    }
  }

  String _getAudioFileName(String letter) {
    // Map Arabic letters to their respective audio file names
    // You would need to create these audio files and add them to your assets
    Map<String, String> audioFileNames = {
      'ا': 'alif',
      'ب': 'ba',
      'ت': 'ta',
      // Add mappings for all letters
    };

    return audioFileNames[letter] ?? 'letter_tap';
  }

  void _animateLetter() {
    _bounceController.reset();
    _bounceController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // Arabic letters data with names and transliterations
    final List<Map<String, String>> arabicLetters = [
      {'letter': 'ا', 'name': 'আলিফ', 'transliteration': 'Alif'},
      {'letter': 'ب', 'name': 'বা', 'transliteration': 'Ba'},
      {'letter': 'ت', 'name': 'তা', 'transliteration': 'Ta'},
      {'letter': 'ث', 'name': 'সা', 'transliteration': 'Tha'},
      {'letter': 'ج', 'name': 'জীম', 'transliteration': 'Jim'},
      {'letter': 'ح', 'name': 'হা', 'transliteration': 'Ha'},
      {'letter': 'خ', 'name': 'খা', 'transliteration': 'Kha'},
      {'letter': 'د', 'name': 'দাল', 'transliteration': 'Dal'},
      {'letter': 'ذ', 'name': 'যাল', 'transliteration': 'Dhal'},
      {'letter': 'ر', 'name': 'রা', 'transliteration': 'Ra'},
      {'letter': 'ز', 'name': 'যায়', 'transliteration': 'Zay'},
      {'letter': 'س', 'name': 'সীন', 'transliteration': 'Sin'},
      {'letter': 'ش', 'name': 'শীন', 'transliteration': 'Shin'},
      {'letter': 'ص', 'name': 'সোয়াদ', 'transliteration': 'Sad'},
      {'letter': 'ض', 'name': 'দোয়াদ', 'transliteration': 'Dad'},
      {'letter': 'ط', 'name': 'তোয়া', 'transliteration': 'Ta'},
      {'letter': 'ظ', 'name': 'যোয়া', 'transliteration': 'Dha'},
      {'letter': 'ع', 'name': 'আইন', 'transliteration': 'Ayn'},
      {'letter': 'غ', 'name': 'গাইন', 'transliteration': 'Ghayn'},
      {'letter': 'ف', 'name': 'ফা', 'transliteration': 'Fa'},
      {'letter': 'ق', 'name': 'ক্বাফ', 'transliteration': 'Qaf'},
      {'letter': 'ك', 'name': 'কাফ', 'transliteration': 'Kaf'},
      {'letter': 'ل', 'name': 'লাম', 'transliteration': 'Lam'},
      {'letter': 'م', 'name': 'মীম', 'transliteration': 'Mim'},
      {'letter': 'ن', 'name': 'নূন', 'transliteration': 'Nun'},
      {'letter': 'ه', 'name': 'হা', 'transliteration': 'Ha'},
      {'letter': 'و', 'name': 'ওয়াও', 'transliteration': 'Waw'},
      {'letter': 'ي', 'name': 'ইয়া', 'transliteration': 'Ya'},
    ];

    // Get a list of colors for the cards
    final List<Color> cardColors = [
      Colors.red.shade100,
      Colors.blue.shade100,
      Colors.green.shade100,
      Colors.purple.shade100,
      Colors.orange.shade100,
      Colors.pink.shade100,
      Colors.teal.shade100,
      Colors.amber.shade100,
      Colors.indigo.shade100,
      Colors.cyan.shade100,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/arabic_icon.png',
              height: 36,
              width: 36,
              errorBuilder:
                  (context, error, stackTrace) => const Icon(
                    Icons.menu_book,
                    size: 36,
                    color: Colors.white,
                  ),
            ),
            const SizedBox(width: 8),
            const Text(
              'আরবী অক্ষর/হরফ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ],
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: const Text(
                        'আরবী বর্ণমালা শিখুন',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      content: const Text(
                        'প্রতিটি অক্ষরে ট্যাপ করে শব্দটি শুনুন এবং উচ্চারণ শিখুন। আরবী ভাষা শেখার জন্য শুভেচ্ছা!',
                        style: TextStyle(fontSize: 16),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('ঠিক আছে'),
                        ),
                      ],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
              );
            },
            tooltip: 'সাহায্য',
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple,
              Colors.deepPurple.shade300,
              Colors.purple.shade100,
            ],
          ),
        ),
        child: Column(
          children: [
            // Top decorative element - rotating stars
            AnimatedBuilder(
              animation: _rotationController,
              builder: (context, child) {
                return SizedBox(
                  height: 50,
                  child: Stack(
                    children: List.generate(10, (index) {
                      return Positioned(
                        left: (MediaQuery.of(context).size.width / 10) * index,
                        top:
                            math.sin(
                                  (_rotationController.value * 2 * math.pi) +
                                      (index / 2),
                                ) *
                                20 +
                            25,
                        child: Icon(
                          Icons.star,
                          color: Colors.yellow.withOpacity(0.7),
                          size: 16,
                        ),
                      );
                    }),
                  ),
                );
              },
            ),

            // Instruction text
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.touch_app, color: Colors.deepPurple),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'অক্ষরগুলোতে ট্যাপ করুন এবং উচ্চারণ শুনুন!',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Grid of letters
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: arabicLetters.length,
                itemBuilder: (context, index) {
                  final randomColorIndex = index % cardColors.length;
                  final isSelected = _selectedIndex == index;

                  return AnimatedBuilder(
                    animation: _bounceAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: isSelected ? _bounceAnimation.value : 1.0,
                        child: child,
                      );
                    },
                    child: _buildLetterCard(
                      context,
                      arabicLetters[index],
                      cardColors[randomColorIndex],
                      index,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // Bottom rainbow decoration
      bottomNavigationBar: Container(
        height: 12,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red,
              Colors.orange,
              Colors.yellow,
              Colors.green,
              Colors.blue,
              Colors.indigo,
              Colors.purple,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLetterCard(
    BuildContext context,
    Map<String, String> letter,
    Color backgroundColor,
    int index,
  ) {
    return Hero(
      tag: 'letter_${letter['letter']}',
      child: Card(
        elevation: 8,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.white.withOpacity(0.5), width: 2),
        ),
        child: InkWell(
          onTap: () {
            _playLetterSound(letter['letter']!);
            setState(() {
              _selectedIndex = index;
            });
            _animateLetter();

            // Show full-screen card with animation
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return _buildDetailDialog(context, letter);
              },
            ).then((_) {
              setState(() {
                _selectedIndex = null;
              });
            });
          },
          borderRadius: BorderRadius.circular(20),
          splashColor: Colors.white.withOpacity(0.5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [backgroundColor, backgroundColor.withOpacity(0.7)],
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Decorative elements
                ...List.generate(
                  4,
                  (i) => Positioned(
                    left: i == 0 ? 10 : null,
                    right: i == 1 ? 10 : null,
                    top: i == 2 ? 10 : null,
                    bottom: i == 3 ? 10 : null,
                    child: Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),

                // Letter content
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Arabic letter
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          letter['letter']!,
                          style: const TextStyle(
                            fontSize: 42,
                            fontFamily: 'Amiri',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Letter name
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        letter['name']!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),

                    // Play icon hint
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.volume_up_rounded,
                          size: 16,
                          color: Colors.grey.shade700,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'শুনুন',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailDialog(BuildContext context, Map<String, String> letter) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepPurple.shade400, Colors.deepPurple.shade800],
          ),
        ),
        child: Stack(
          children: [
            // Background decorative elements
            ...List.generate(
              20,
              (index) => Positioned(
                left:
                    math.Random().nextDouble() *
                    MediaQuery.of(context).size.width,
                top:
                    math.Random().nextDouble() *
                    MediaQuery.of(context).size.height,
                child: Icon(
                  Icons.star,
                  size: math.Random().nextDouble() * 20 + 10,
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
            ),

            // Close button
            Positioned(
              right: 16,
              top: 40,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 32),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            // Content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Big letter display with animation
                  TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0.5, end: 1.0),
                    duration: const Duration(milliseconds: 500),
                    builder: (context, value, child) {
                      return Transform.scale(scale: value, child: child);
                    },
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          letter['letter']!,
                          style: const TextStyle(
                            fontSize: 120,
                            fontFamily: 'Amiri',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Letter name and details
                  AnimatedOpacity(
                    opacity: 1.0,
                    duration: const Duration(milliseconds: 800),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 32),
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'নাম: ${letter['name']}',
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'উচ্চারণ: ${letter['transliteration']}',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.grey.shade800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Action buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          _playLetterSound(letter['letter']!);
                        },
                        icon: const Icon(Icons.volume_up),
                        label: const Text(
                          'আবার শুনুন',
                          style: TextStyle(fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          foregroundColor: Colors.black87,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
