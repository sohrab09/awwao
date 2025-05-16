import 'package:flutter/material.dart';

class PrayerIntentionScreen extends StatelessWidget {
  const PrayerIntentionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Prayer intention list
    final List<Map<String, String>> prayerIntentions = [
      {
        'prayer': 'ফজর',
        'arabic': 'أُصَلِّي فَرْضَ الصُّبْحِ رَكْعَتَيْنِ لِلَّهِ تَعَالَى',
        'bangla': 'উসাল্লি ফারদাস্‌ সুবহি রাকআতাইনি লিল্লাহি তাআ\'লা',
        'meaning': 'আমি ফজরের ফরজ দুই রাকাত নামাজ আদায় করছি আল্লাহর জন্য',
        'color': '#FFD6A5', // Soft orange
        'icon': 'sunrise',
      },
      {
        'prayer': 'যোহর',
        'arabic':
            'أُصَلِّي فَرْضَ الظُّهْرِ أَرْبَعَ رَكْعَاتٍ لِلَّهِ تَعَالَى',
        'bangla': 'উসাল্লি ফারদায যুহরি আরবাআ রাকাআতিন লিল্লাহি তাআ\'লা',
        'meaning': 'আমি যোহরের ফরজ চার রাকাত নামাজ আদায় করছি আল্লাহর জন্য',
        'color': '#FDFFB6', // Soft yellow
        'icon': 'sun',
      },
      {
        'prayer': 'আসর',
        'arabic':
            'أُصَلِّي فَرْضَ الْعَصْرِ أَرْبَعَ رَكْعَاتٍ لِلَّهِ تَعَالَى',
        'bangla': 'উসাল্লি ফারদাল আসরি আরবাআ রাকাআতিন লিল্লাহি তাআ\'লা',
        'meaning': 'আমি আসরের ফরজ চার রাকাত নামাজ আদায় করছি আল্লাহর জন্য',
        'color': '#CAFFBF', // Soft green
        'icon': 'afternoon',
      },
      {
        'prayer': 'মাগরিব',
        'arabic':
            'أُصَلِّي فَرْضَ الْمَغْرِبِ ثَلَاثَ رَكْعَاتٍ لِلَّهِ تَعَالَى',
        'bangla': 'উসাল্লি ফারদাল মাগরিবি সালাসা রাকাআতিন লিল্লাহি তাআ\'লা',
        'meaning': 'আমি মাগরিবের ফরজ তিন রাকাত নামাজ আদায় করছি আল্লাহর জন্য',
        'color': '#9BF6FF', // Soft blue
        'icon': 'sunset',
      },
      {
        'prayer': 'এশা',
        'arabic':
            'أُصَلِّي فَرْضَ الْعِشَاءِ أَرْبَعَ رَكْعَاتٍ لِلَّهِ تَعَالَى',
        'bangla': 'উসাল্লি ফারদাল ইশাই আরবাআ রাকাআতিন লিল্লাহি তাআ\'লা',
        'meaning': 'আমি এশার ফরজ চার রাকাত নামাজ আদায় করছি আল্লাহর জন্য',
        'color': '#BDB2FF', // Soft purple
        'icon': 'night',
      },
      {
        'prayer': 'জুমআ',
        'arabic': 'أُصَلِّي فَرْضَ الْجُمُعَةِ رَكْعَتَيْنِ لِلَّهِ تَعَالَى',
        'bangla': 'উসাল্লি ফারদাল জুমুআতি রাকআতাইনি লিল্লাহি তাআ\'লা',
        'meaning': 'আমি জুমআর ফরজ দুই রাকাত নামাজ আদায় করছি আল্লাহর জন্য',
        'color': '#FFC6FF', // Soft pink
        'icon': 'friday',
      },
      {
        'prayer': 'ঈদ',
        'arabic': 'أُصَلِّي سُنَّةَ الْعِيدِ رَكْعَتَيْنِ لِلَّهِ تَعَالَى',
        'bangla': 'উসাল্লি সুন্নাতাল ঈদি রাকআতাইনি লিল্লাহি তাআ\'লা',
        'meaning': 'আমি ঈদের সুন্নাত দুই রাকাত নামাজ আদায় করছি আল্লাহর জন্য',
        'color': '#FFADAD', // Soft red
        'icon': 'celebration',
      },
      {
        'prayer': 'তারাবীহ',
        'arabic':
            'أُصَلِّي سُنَّةَ التَّرَاوِيحِ رَكْعَتَيْنِ لِلَّهِ تَعَالَى',
        'bangla': 'উসাল্লি সুন্নাতাত তারাবীহি রাকআতাইনি লিল্লাহি তাআ\'লা',
        'meaning':
            'আমি তারাবীহের সুন্নাত দুই রাকাত নামাজ আদায় করছি আল্লাহর জন্য',
        'color': '#A0C4FF', // Soft sky blue
        'icon': 'moon',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: const Text(
          'নামাজের নিয়ত',
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
            colors: [Colors.blue.shade50, Colors.blue.shade100],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.blue.shade200, width: 2),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.pink, size: 28),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'আজকে কোন নামাজ পড়বে? নিয়ত করতে টাচ করো!',
                        style: TextStyle(fontSize: 16, color: Colors.indigo),
                      ),
                    ),
                  ],
                ),
              ),

              // Prayer list
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: prayerIntentions.length,
                  itemBuilder: (context, index) {
                    final intention = prayerIntentions[index];
                    final color = Color(
                      int.parse(
                            intention['color']!.substring(1, 7),
                            radix: 16,
                          ) +
                          0xFF000000,
                    );

                    return GestureDetector(
                      onTap: () {
                        _showPrayerDetails(context, intention);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: color.withOpacity(0.4),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                          border: Border.all(color: color, width: 2),
                        ),
                        child: Row(
                          children: [
                            // Left color bar with icon
                            Container(
                              width: 80,
                              height: 100,
                              decoration: BoxDecoration(
                                color: color.withOpacity(0.3),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(18),
                                  bottomLeft: Radius.circular(18),
                                ),
                              ),
                              child: _getPrayerIcon(intention['icon']!),
                            ),

                            // Prayer name and hint
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${intention['prayer']} নামাজের নিয়ত',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'টাচ করে নিয়ত দেখুন',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Arrow indicator
                            Container(
                              padding: const EdgeInsets.all(16),
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.indigo,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Return an icon based on prayer type
  Widget _getPrayerIcon(String iconType) {
    IconData iconData;
    Color iconColor;

    switch (iconType) {
      case 'sunrise':
        iconData = Icons.wb_sunny_outlined;
        iconColor = Colors.orange;
        break;
      case 'sun':
        iconData = Icons.wb_sunny;
        iconColor = Colors.amber;
        break;
      case 'afternoon':
        iconData = Icons.wb_cloudy;
        iconColor = Colors.green;
        break;
      case 'sunset':
        iconData = Icons.wb_twilight;
        iconColor = Colors.blue;
        break;
      case 'night':
        iconData = Icons.nightlight_round;
        iconColor = Colors.indigo;
        break;
      case 'friday':
        iconData = Icons.calendar_today;
        iconColor = Colors.purple;
        break;
      case 'celebration':
        iconData = Icons.celebration;
        iconColor = Colors.red;
        break;
      case 'moon':
        iconData = Icons.nights_stay;
        iconColor = Colors.blue.shade700;
        break;
      default:
        iconData = Icons.star;
        iconColor = Colors.amber;
    }

    return Center(child: Icon(iconData, color: iconColor, size: 40));
  }

  // Show prayer details in a beautiful dialog
  void _showPrayerDetails(BuildContext context, Map<String, String> intention) {
    final color = Color(
      int.parse(intention['color']!.substring(1, 7), radix: 16) + 0xFF000000,
    );

    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.3),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          _getPrayerIcon(intention['icon']!),
                          const SizedBox(height: 12),
                          Text(
                            '${intention['prayer']} নামাজের নিয়ত',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Arabic text
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      intention['arabic']!,
                      style: const TextStyle(
                        fontSize: 26,
                        fontFamily: 'Amiri',
                        height: 1.5,
                      ),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                  ),

                  // Pronunciation
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.record_voice_over, color: Colors.indigo),
                            SizedBox(width: 8),
                            Text(
                              'উচ্চারণ:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          intention['bangla']!,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),

                  // Meaning
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.translate, color: Colors.indigo),
                            SizedBox(width: 8),
                            Text(
                              'অর্থ:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          intention['meaning']!,
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 20),

                        // Close button
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: color,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'ঠিক আছে',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
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
