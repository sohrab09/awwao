import 'package:flutter/material.dart';

class PrayerRulesScreen extends StatelessWidget {
  const PrayerRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Prayer rules list with enhanced details for children
    final List<Map<String, dynamic>> prayerRules = [
      {
        'title': 'ওযু করা',
        'details':
            'নামাজ শুরু করার আগে অবশ্যই পবিত্রতা অর্জন করতে হবে। এজন্য সঠিকভাবে ওযু করতে হবে। ওযু ভঙ্গ হলে পুনরায় ওযু করতে হবে।',
        'icon': Icons.water_drop,
        'color': Colors.blue.shade300,
        'kidFriendlyTip':
            'হাত, মুখ, নাক, পা ধুয়ে পরিষ্কার হয়ে নামাজের জন্য প্রস্তুত হও!',
        'background': 'waterdrops.png',
      },
      {
        'title': 'কিবলামুখী হওয়া',
        'details':
            'নামাজ আদায়ের সময় অবশ্যই কাবার দিকে মুখ করে দাঁড়াতে হবে। এটি নামাজের একটি গুরুত্বপূর্ণ শর্ত।',
        'icon': Icons.explore,
        'color': Colors.green.shade300,
        'kidFriendlyTip':
            'কাবার দিকে মুখ করে দাঁড়াও, যেন তুমি আল্লাহর সামনে আছো!',
        'background': 'compass.png',
      },
      {
        'title': 'নিয়ত করা',
        'details':
            'যে নামাজ পড়বেন তার নিয়ত অন্তরে করতে হবে। নিয়ত ছাড়া নামাজ শুদ্ধ হয় না।',
        'icon': Icons.favorite,
        'color': Colors.red.shade300,
        'kidFriendlyTip':
            'তোমার হৃদয়ে বলো, "আমি এই নামাজ আল্লাহর জন্য পড়ছি!"',
        'background': 'heart.png',
      },
      {
        'title': 'সময় নিয়ম',
        'details':
            'নামাজ তার নির্ধারিত সময়ে আদায় করতে হবে। নামাজের সময় না হলে নামাজ আদায় করা যাবে না।',
        'icon': Icons.access_time,
        'color': Colors.amber.shade300,
        'kidFriendlyTip': 'ঘড়ি দেখে সময়মতো নামাজ পড়া শুরু করো!',
        'background': 'clock.png',
      },
      {
        'title': 'সতর ঢাকা',
        'details':
            'নামাজের সময় শরীরের নির্দিষ্ট অংশ (সতর) ঢেকে রাখতে হবে। পুরুষদের নাভি থেকে হাঁটু পর্যন্ত এবং মহিলাদের মুখ, হাত ও পা ছাড়া সমস্ত শরীর ঢাকতে হবে।',
        'icon': Icons.accessibility_new,
        'color': Colors.purple.shade300,
        'kidFriendlyTip': 'পরিষ্কার, সুন্দর কাপড় পরে নামাজ পড়ো!',
        'background': 'clothes.png',
      },
      {
        'title': 'পবিত্র স্থান',
        'details':
            'নামাজের স্থান অবশ্যই পবিত্র হতে হবে। অপবিত্র স্থানে নামাজ আদায় করা যায় না।',
        'icon': Icons.place,
        'color': Colors.teal.shade300,
        'kidFriendlyTip':
            'পরিষ্কার জায়নামাজে বা পরিষ্কার জায়গায় নামাজ পড়ো!',
        'background': 'place.png',
      },
      {
        'title': 'তাকবীরে তাহরীমা',
        'details': 'নামাজ শুরু করার জন্য "আল্লাহু আকবার" বলে তাকবীর দিতে হবে।',
        'icon': Icons.record_voice_over,
        'color': Colors.indigo.shade300,
        'kidFriendlyTip': 'দুই হাত তুলে "আল্লাহু আকবার" বলে নামাজ শুরু করো!',
        'background': 'speech.png',
      },
      {
        'title': 'কিয়াম',
        'details':
            'নামাজে দাঁড়িয়ে থাকাকে কিয়াম বলে। এটি ফরজ ও ওয়াজিব নামাজের প্রথম রুকন।',
        'icon': Icons.accessibility,
        'color': Colors.brown.shade300,
        'kidFriendlyTip': 'সোজা হয়ে দাঁড়াও এবং আল্লাহর দিকে মনোযোগ দাও!',
        'background': 'standing.png',
      },
      {
        'title': 'রুকু',
        'details':
            'কুরআন পাঠ শেষে "আল্লাহু আকবার" বলে কোমর পর্যন্ত ঝুঁকে রুকু করতে হবে।',
        'icon': Icons.arrow_downward,
        'color': Colors.orange.shade300,
        'kidFriendlyTip':
            '"আল্লাহু আকবার" বলে ঝুঁকে পড়ো, হাত দিয়ে হাঁটু ধরো!',
        'background': 'bow.png',
      },
      {
        'title': 'সিজদা',
        'details':
            'রুকু থেকে উঠে "আল্লাহু আকবার" বলে সিজদায় যেতে হবে। মাথা, নাক, হাত, হাঁটু এবং পা মাটিতে রাখতে হবে।',
        'icon': Icons.airline_seat_flat,
        'color': Colors.cyan.shade300,
        'kidFriendlyTip': 'মাটিতে কপাল রেখে আল্লাহর সামনে নত হও!',
        'background': 'prostrate.png',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: const Text(
          'নামাজের নিয়ম',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.lightBlue.shade50, Colors.lightBlue.shade100],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Background decoration elements
              Positioned(
                top: 20,
                right: -30,
                child: Opacity(
                  opacity: 0.1,
                  child: Icon(
                    Icons.mosque,
                    size: 150,
                    color: Colors.indigo.shade900,
                  ),
                ),
              ),
              Positioned(
                bottom: -10,
                left: -30,
                child: Opacity(
                  opacity: 0.1,
                  child: Icon(
                    Icons.star,
                    size: 120,
                    color: Colors.indigo.shade900,
                  ),
                ),
              ),

              // Main content
              Column(
                children: [
                  // Friendly guide section
                  Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.lightBlue.shade300,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.lightBlue.shade100,
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.amber.shade100,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.lightbulb,
                            color: Colors.amber.shade700,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Text(
                            'নামাজের গুরুত্বপূর্ণ নিয়মগুলো জানা খুব জরুরি! সঠিক নিয়মে নামাজ পড়া শিখি।',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.indigo,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Prayer rules list
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: prayerRules.length,
                      itemBuilder: (context, index) {
                        final rule = prayerRules[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: rule['color'].withOpacity(0.4),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  // Colored icon section
                                  Container(width: 16, color: rule['color']),

                                  // Content section
                                  Expanded(
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                        dividerColor: Colors.transparent,
                                        colorScheme: ColorScheme.fromSwatch()
                                            .copyWith(secondary: rule['color']),
                                      ),
                                      child: ExpansionTile(
                                        leading: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: rule['color'].withOpacity(
                                              0.2,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            rule['icon'],
                                            color: rule['color'],
                                            size: 28,
                                          ),
                                        ),
                                        title: Text(
                                          rule['title'],
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.indigo.shade800,
                                          ),
                                        ),
                                        expandedCrossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        childrenPadding: const EdgeInsets.only(
                                          left: 16,
                                          right: 16,
                                          bottom: 16,
                                        ),
                                        children: [
                                          // Main rule details
                                          Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Text(
                                              rule['details'],
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey.shade800,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 12),

                                          // Kid-friendly tip with a star icon
                                          Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color: rule['color'].withOpacity(
                                                0.1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color: rule['color']
                                                    .withOpacity(0.5),
                                                width: 1,
                                              ),
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: rule['color'],
                                                  size: 20,
                                                ),
                                                const SizedBox(width: 8),
                                                Expanded(
                                                  child: Text(
                                                    rule['kidFriendlyTip'],
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          Colors
                                                              .indigo
                                                              .shade800,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          // Optional: Could add an illustration here
                                          // if images were available
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Animated character widget that could be added
class AnimatedCharacter extends StatefulWidget {
  const AnimatedCharacter({super.key});

  @override
  State<AnimatedCharacter> createState() => _AnimatedCharacterState();
}

class _AnimatedCharacterState extends State<AnimatedCharacter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: 10).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.amber.shade100,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.emoji_emotions,
                color: Colors.amber.shade700,
                size: 40,
              ),
            ),
          ),
        );
      },
    );
  }
}
