import 'package:flutter/material.dart';

class DuaScreen extends StatefulWidget {
  const DuaScreen({super.key});

  @override
  State<DuaScreen> createState() => _DuaScreenState();
}

class _DuaScreenState extends State<DuaScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // বিভিন্ন দোয়া
  final List<Map<String, String>> duas = [
    {
      'title': 'খাবার শুরুর দোয়া',
      'arabic': 'بِسْمِ اللهِ',
      'bangla': 'বিসমিল্লাহ',
      'meaning': 'আল্লাহর নামে',
      'transliteration': 'Bismillah',
      'icon': 'food',
      'color': '0xFFF06292', // Pink
    },
    {
      'title': 'খাবার শেষের দোয়া',
      'arabic':
          'الْحَمْدُ لِلَّهِ الَّذِي أَطْعَمَنَا وَسَقَانَا وَجَعَلَنَا مِنَ الْمُسْلِمِينَ',
      'bangla':
          "আলহামদুলিল্লাহিল্লাজি আত্ব'আমানা ওয়া সাক্বানা ওয়া জা'আলানা মিনাল মুসলিমিন",
      'meaning':
          'সমস্ত প্রশংসা আল্লাহর জন্য যিনি আমাদের খাওয়ালেন এবং পান করালেন এবং আমাদের মুসলিম বানালেন',
      'transliteration':
          'Alhamdulillahil-ladhi at\'amana wa saqana wa ja\'alana minal muslimin',
      'icon': 'plate',
      'color': '0xFF9575CD', // Purple
    },
    {
      'title': 'ঘুমানোর আগের দোয়া',
      'arabic': 'بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَا',
      'bangla': 'বিসমিকা আল্লাহুম্মা আমুতু ওয়া আহ্ইয়া',
      'meaning':
          'হে আল্লাহ! আমি তোমার নামে (ঘুমের মধ্যে) মারা যাই এবং (ঘুম থেকে) জীবিত হই',
      'transliteration': 'Bismika Allahumma amutu wa ahya',
      'icon': 'sleep',
      'color': '0xFF4DB6AC', // Teal
    },
    {
      'title': 'ঘুম থেকে উঠার দোয়া',
      'arabic':
          'الْحَمْدُ لِلَّهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ',
      'bangla':
          'আলহামদুলিল্লাহিল্লাজি আহ্ইয়ানা বা\'দা মা আমাতানা ওয়া ইলাইহিন নুশুর',
      'meaning':
          'সমস্ত প্রশংসা আল্লাহর জন্য যিনি আমাদেরকে মৃত্যুর (ঘুমের) পর জীবন দান করেছেন এবং তাঁর কাছেই ফিরে যেতে হবে',
      'transliteration':
          'Alhamdulillahil-ladhi ahyana ba\'da ma amatana wa ilaihin-nushur',
      'icon': 'wake',
      'color': '0xFFFFB74D', // Orange
    },
    {
      'title': 'মসজিদে প্রবেশের দোয়া',
      'arabic': 'اَللّٰهُمَّ افْتَحْ لِيْ اَبْوَابَ رَحْمَتِكَ',
      'bangla': 'আল্লাহুম্মাফতাহ লি আবওয়াবা রাহমাতিকা',
      'meaning': 'হে আল্লাহ! আমার জন্য তোমার রহমতের দরজাগুলো খুলে দাও',
      'transliteration': 'Allahumma aftah li abwaba rahmatika',
      'icon': 'mosque',
      'color': '0xFF4CAF50', // Green
    },
  ];

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
        title: const Text(
          'দোয়া শিখি',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: duas.length,
              itemBuilder: (context, index) {
                final dua = duas[index];
                return DuaCard(dua: dua);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                duas.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 10,
                  width: _currentPage == index ? 30 : 10,
                  decoration: BoxDecoration(
                    color:
                        _currentPage == index
                            ? Theme.of(context).colorScheme.secondary
                            : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 8,
        notchMargin: 8,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded),
                onPressed:
                    _currentPage > 0
                        ? () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                        : null,
                color:
                    _currentPage > 0
                        ? Theme.of(context).primaryColor
                        : Colors.grey.shade400,
              ),
              Text(
                '${_currentPage + 1}/${duas.length}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios_rounded),
                onPressed:
                    _currentPage < duas.length - 1
                        ? () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                        : null,
                color:
                    _currentPage < duas.length - 1
                        ? Theme.of(context).primaryColor
                        : Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'দোয়া সমূহ',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: duas.length,
                          itemBuilder: (context, index) {
                            final dua = duas[index];
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Color(
                                  int.parse(dua['color']!),
                                ),
                                child: getIconForDua(dua['icon']!),
                              ),
                              title: Text(dua['title']!),
                              onTap: () {
                                Navigator.pop(context);
                                _pageController.animateToPage(
                                  index,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.menu),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getIconForDua(String iconName) {
    switch (iconName) {
      case 'food':
        return const Icon(Icons.restaurant, color: Colors.white);
      case 'plate':
        return const Icon(Icons.fastfood, color: Colors.white);
      case 'sleep':
        return const Icon(Icons.nightlight_round, color: Colors.white);
      case 'wake':
        return const Icon(Icons.wb_sunny, color: Colors.white);
      case 'mosque':
        return const Icon(Icons.mosque, color: Colors.white);
      default:
        return const Icon(Icons.star, color: Colors.white);
    }
  }
}

class DuaCard extends StatelessWidget {
  final Map<String, String> dua;

  const DuaCard({super.key, required this.dua});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(int.parse(dua['color']!)).withOpacity(0.8),
            Color(int.parse(dua['color']!)).withOpacity(0.6),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildDuaIcon(),
            const SizedBox(height: 10),
            Text(
              dua['title']!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        dua['arabic']!,
                        style: const TextStyle(
                          fontSize: 28,
                          fontFamily: 'Amiri',
                          height: 1.5,
                        ),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                        height: 40,
                      ),
                      _buildInfoSection(
                        'উচ্চারণ:',
                        dua['bangla']!,
                        Icons.record_voice_over,
                      ),
                      const SizedBox(height: 16),
                      _buildInfoSection(
                        'লিপ্যন্তরণ:',
                        dua['transliteration']!,
                        Icons.spellcheck,
                      ),
                      const SizedBox(height: 16),
                      _buildInfoSection(
                        'অর্থ:',
                        dua['meaning']!,
                        Icons.translate,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildDuaIcon() {
    IconData iconData = Icons.star;

    switch (dua['icon']) {
      case 'food':
        iconData = Icons.restaurant;
        break;
      case 'plate':
        iconData = Icons.fastfood;
        break;
      case 'sleep':
        iconData = Icons.nightlight_round;
        break;
      case 'wake':
        iconData = Icons.wb_sunny;
        break;
      case 'mosque':
        iconData = Icons.mosque;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Icon(iconData, size: 48, color: Color(int.parse(dua['color']!))),
    );
  }

  Widget _buildInfoSection(String title, String content, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 20, color: Color(int.parse(dua['color']!))),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color(int.parse(dua['color']!)).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            content,
            style: const TextStyle(fontSize: 16, height: 1.5),
          ),
        ),
      ],
    );
  }
}
