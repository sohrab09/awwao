import 'package:flutter/material.dart';
import 'dart:math';

class Poem {
  final String title;
  final String subtitle;
  final String content;
  final IconData icon;

  Poem({
    required this.title,
    required this.subtitle,
    required this.content,
    required this.icon,
  });
}

class EnglishScreen extends StatefulWidget {
  const EnglishScreen({super.key});

  @override
  State<EnglishScreen> createState() => _EnglishScreenState();
}

class _EnglishScreenState extends State<EnglishScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color(0xFFFFFFFF),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'ইংরেজি শিখি',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFFFFF),
            fontSize: 24,
            fontFamily: 'Hind Siliguri',
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(
          0xFF3F51B5,
        ), // Indigo - formal but friendly
        elevation: 2,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF5F5F5), // Light gray background - clean and formal
        ),
        child: Column(
          children: [
            // Learning progress banner
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF3F51B5).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.school,
                      color: Color(0xFF3F51B5),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'English Learning',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3F51B5),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Select a category to continue',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF757575),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Categories grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    _buildCategoryCard(
                      title: 'Capital Letter',
                      subtitle: 'A to Z',
                      icon: Icons.text_fields,
                      image: 'assets/icons/capital.png',
                      bgColor: const Color(0xFFC5CAE9), // Light indigo
                      iconColor: const Color(0xFF3F51B5), // Indigo
                      onTap:
                          () => _navigateTo(
                            context,
                            _buildCapitalLettersScreen(),
                          ),
                    ),
                    _buildCategoryCard(
                      title: 'Small Letter',
                      subtitle: 'a to z',
                      icon: Icons.text_format,
                      image: 'assets/icons/small.png',
                      bgColor: const Color(0xFFBBDEFB), // Light blue
                      iconColor: const Color(0xFF2196F3), // Blue
                      onTap:
                          () =>
                              _navigateTo(context, _buildSmallLettersScreen()),
                    ),
                    _buildCategoryCard(
                      title: 'Numbers',
                      subtitle: '0 to 100',
                      icon: Icons.format_list_numbered,
                      image: 'assets/icons/number.png',
                      bgColor: const Color(0xFFC8E6C9), // Light green
                      iconColor: const Color(0xFF4CAF50), // Green
                      onTap: () => _navigateTo(context, _buildNumbersScreen()),
                    ),
                    _buildCategoryCard(
                      title: 'Weeks',
                      subtitle: '7 Days',
                      icon: Icons.calendar_today,
                      image: 'assets/icons/week.png',
                      bgColor: const Color(0xFFFFE0B2), // Light orange
                      iconColor: const Color(0xFFFF9800), // Orange
                      onTap: () => _navigateTo(context, _buildWeeksScreen()),
                    ),
                    _buildCategoryCard(
                      title: 'Months',
                      subtitle: '12 Months',
                      icon: Icons.date_range,
                      image: 'assets/icons/month.png',
                      bgColor: const Color(0xFFE1BEE7), // Light purple
                      iconColor: const Color(0xFF9C27B0), // Purple
                      onTap: () => _navigateTo(context, _buildMonthsScreen()),
                    ),
                    _buildCategoryCard(
                      title: 'Poems',
                      subtitle: 'Short Poems',
                      icon: Icons.auto_stories,
                      image: 'assets/icons/poetry.png',
                      bgColor: const Color(0xFFFFCCBC), // Light deep orange
                      iconColor: const Color(0xFF795548), // Brown
                      onTap: () => _navigateTo(context, _buildPoemsScreen()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Formal but kid-friendly category card
  Widget _buildCategoryCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color bgColor,
    required Color iconColor,
    required VoidCallback onTap,
    String? image,
  }) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: bgColor,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: bgColor, width: 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon container
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: bgColor.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                // child: Icon(icon, size: 40, color: iconColor),
                child: Image.asset(image!, width: 40, height: 40),
              ),
              const SizedBox(height: 12),
              // Title
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: iconColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              // Subtitle
              Text(
                subtitle,
                style: const TextStyle(fontSize: 14, color: Color(0xFF757575)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Sample content screens
  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  // Capital Letters Screen
  Widget _buildCapitalLettersScreen() {
    return _buildLearningScreen(
      title: 'Capital Letters',
      themeColor: const Color(0xFF3F51B5),
      content: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Changed from 4 to 2 letters per row
          childAspectRatio: 1.5, // Adjusted for better proportions
          mainAxisSpacing: 16, // Increased spacing
          crossAxisSpacing: 16, // Increased spacing
        ),
        itemCount: 26,
        itemBuilder: (context, index) {
          final letter = String.fromCharCode(65 + index); // A-Z
          return _buildLetterCard(letter, const Color(0xFF3F51B5));
        },
      ),
    );
  }

  // Small Letters Screen
  Widget _buildSmallLettersScreen() {
    return _buildLearningScreen(
      title: 'Small Letters',
      themeColor: const Color(0xFF2196F3),
      content: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Changed from 4 to 2 letters per row
          childAspectRatio: 1.5, // Adjusted for better proportions
          mainAxisSpacing: 16, // Increased spacing
          crossAxisSpacing: 16, // Increased spacing
        ),
        itemCount: 26,
        itemBuilder: (context, index) {
          final letter = String.fromCharCode(97 + index); // a-z
          return _buildLetterCard(letter, const Color(0xFF2196F3));
        },
      ),
    );
  }

  // Numbers Screen
  Widget _buildNumbersScreen() {
    return _buildLearningScreen(
      title: 'Numbers',
      themeColor: const Color(0xFF4CAF50),
      content: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemCount: 101, // 0-100 numbers
        itemBuilder: (context, index) {
          return _buildNumberCard(
            number: index,
            color: const Color(0xFF4CAF50),
          );
        },
      ),
    );
  }

  // Template for all learning screens
  Widget _buildLearningScreen({
    required String title,
    required Color themeColor,
    required Widget content,
  }) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 30,
            fontFamily: 'Hind Siliguri',
          ),
        ),
        backgroundColor: themeColor,
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.volume_up),
            onPressed: () {
              // Audio pronunciation function
            },
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFF5F5F5),
        child: Column(
          children: [
            // Learning info bar
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: themeColor.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: themeColor),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Tap on each item to hear pronunciation',
                      style: TextStyle(color: themeColor),
                    ),
                  ),
                ],
              ),
            ),

            // Main content
            Expanded(child: content),
          ],
        ),
      ),
    );
  }

  // Card for letters
  Widget _buildLetterCard(String text, Color color) {
    return Card(
      elevation: 4, // Increased elevation for better shadow
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          // Pronunciation function
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withOpacity(0.5), width: 2),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 60, // Significantly increased font size
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Letter $text", // Added descriptive text
                  style: TextStyle(fontSize: 16, color: color.withOpacity(0.7)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Enhanced card for numbers with English text format
  Widget _buildNumberCard({required int number, required Color color}) {
    // Get the English text representation of the number
    String getNumberInWords(int num) {
      if (num == 0) return 'Zero';
      if (num == 1) return 'One';
      if (num == 2) return 'Two';
      if (num == 3) return 'Three';
      if (num == 4) return 'Four';
      if (num == 5) return 'Five';
      if (num == 6) return 'Six';
      if (num == 7) return 'Seven';
      if (num == 8) return 'Eight';
      if (num == 9) return 'Nine';
      if (num == 10) return 'Ten';
      if (num == 11) return 'Eleven';
      if (num == 12) return 'Twelve';
      if (num == 13) return 'Thirteen';
      if (num == 14) return 'Fourteen';
      if (num == 15) return 'Fifteen';
      if (num == 16) return 'Sixteen';
      if (num == 17) return 'Seventeen';
      if (num == 18) return 'Eighteen';
      if (num == 19) return 'Nineteen';
      if (num >= 20 && num < 30) {
        return 'Twenty${num > 20 ? '-${getNumberInWords(num - 20)}' : ''}';
      }
      if (num >= 30 && num < 40) {
        return 'Thirty${num > 30 ? '-${getNumberInWords(num - 30)}' : ''}';
      }
      if (num >= 40 && num < 50) {
        return 'Forty${num > 40 ? '-${getNumberInWords(num - 40)}' : ''}';
      }
      if (num >= 50 && num < 60) {
        return 'Fifty${num > 50 ? '-${getNumberInWords(num - 50)}' : ''}';
      }
      if (num >= 60 && num < 70) {
        return 'Sixty${num > 60 ? '-${getNumberInWords(num - 60)}' : ''}';
      }
      if (num >= 70 && num < 80) {
        return 'Seventy${num > 70 ? '-${getNumberInWords(num - 70)}' : ''}';
      }
      if (num >= 80 && num < 90) {
        return 'Eighty${num > 80 ? '-${getNumberInWords(num - 80)}' : ''}';
      }
      if (num >= 90 && num < 100) {
        return 'Ninety${num > 90 ? '-${getNumberInWords(num - 90)}' : ''}';
      }
      if (num == 100) return 'One Hundred';
      return num.toString(); // Fallback
    }

    String numberInWords = getNumberInWords(number);

    return Card(
      elevation: 4,
      shadowColor: color.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          // Pronunciation function
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withOpacity(0.5), width: 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Large number display
              Text(
                number.toString(),
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 8),
              // Divider
              Container(height: 1, width: 40, color: color.withOpacity(0.3)),
              const SizedBox(height: 8),
              // Number in words
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  numberInWords,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: color.withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Weeks Screen - Enhanced Design
  Widget _buildWeeksScreen() {
    final days = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
    ];

    final dayIcons = [
      Icons.wb_sunny_outlined, // Sunday
      Icons.work_outline, // Monday
      Icons.sports_soccer_outlined, // Tuesday
      Icons.local_library_outlined, // Wednesday
      Icons.school_outlined, // Thursday
      Icons.mosque_outlined, // Friday
      Icons.weekend_outlined, // Saturday
    ];

    return _buildLearningScreen(
      title: 'Days of the Week',
      themeColor: const Color(0xFFFF9800),
      content: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: days.length,
        itemBuilder: (context, index) {
          return _buildEnhancedDayCard(
            days[index],
            'Day ${index + 1}',
            const Color(0xFFFF9800),
            dayIcons[index],
            index,
          );
        },
      ),
    );
  }

  // Enhanced Day Card
  Widget _buildEnhancedDayCard(
    String day,
    String subtitle,
    Color color,
    IconData icon,
    int index,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 100,
      child: Card(
        elevation: 4,
        shadowColor: color.withOpacity(0.3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: InkWell(
          onTap: () {
            // Pronunciation or detail view
          },
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color.withOpacity(0.3)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                // Left side with number
                Container(
                  width: 80,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.8),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(icon, color: Colors.white, size: 32),
                        const SizedBox(height: 4),
                        Text(
                          subtitle,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Right side with day name
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          day,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.volume_up,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Tap to listen',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Months Screen - Enhanced Design
  Widget _buildMonthsScreen() {
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    // Month-specific icons
    final monthIcons = [
      Icons.ac_unit, // January - snow/winter
      Icons.favorite, // February - Valentine's
      Icons.air, // March - wind/spring coming
      Icons.eco, // April - flowers/spring
      Icons.park, // May - parks/nature
      Icons.wb_sunny, // June - summer sun
      Icons.beach_access, // July - beach/vacation
      Icons.pool, // August - swimming/summer
      Icons.school, // September - back to school
      Icons.forest, // October - fall/autumn
      Icons.food_bank, // November - thanksgiving/food
      Icons.celebration, // December - holidays/celebration
    ];

    return _buildLearningScreen(
      title: 'Months of the Year',
      themeColor: const Color(0xFF9C27B0),
      content: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: months.length,
        itemBuilder: (context, index) {
          return _buildEnhancedMonthCard(
            months[index],
            'Month ${index + 1}',
            const Color(0xFF9C27B0),
            monthIcons[index],
          );
        },
      ),
    );
  }

  // Enhanced Month Card
  Widget _buildEnhancedMonthCard(
    String month,
    String subtitle,
    Color color,
    IconData icon,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Card(
        elevation: 4,
        shadowColor: color.withOpacity(0.3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: InkWell(
          onTap: () {
            // Pronunciation or detail view
          },
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: color.withOpacity(0.5), width: 2),
            ),
            child: Row(
              children: [
                // Left circle with icon
                Container(
                  width: 80,
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Center(child: Icon(icon, color: color, size: 32)),
                  ),
                ),
                // Right side with month info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        month,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                    ],
                  ),
                ),
                // Right icon
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Icon(Icons.volume_up, color: color),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Poems Screen - Enhanced Design
  Widget _buildPoemsScreen() {
    final List<Poem> poems = [
      Poem(
        title: 'Twinkle Twinkle Little Star',
        subtitle: 'A nursery rhyme about stars.',
        content:
            'Twinkle, twinkle, little star,\nHow I wonder what you are!\nUp above the world so high,\nLike a diamond in the sky.\nTwinkle, twinkle, little star,\nHow I wonder what you are!',
        icon: Icons.star,
      ),
      Poem(
        title: 'Baa Baa Black Sheep',
        subtitle: 'A nursery rhyme about a black sheep.',
        content:
            'Baa, baa, black sheep,\nHave you any wool?\nYes sir, yes sir,\nThree bags full!\nOne for the master,\nOne for the dame,\nAnd one for the little boy\nWho lives down the lane.\nBaa, baa, black sheep,\nHave you any wool?\nYes sir, yes sir,\nThree bags full!',
        icon: Icons.pets,
      ),
      Poem(
        title: 'Jack and Jill',
        subtitle: 'A nursery rhyme about Jack and Jill going up a hill.',
        content:
            'Jack and Jill went up the hill,\nTo fetch a pail of water.\nJack fell down and broke his crown,\nAnd Jill came tumbling after.',
        icon: Icons.terrain,
      ),
      Poem(
        title: 'Humpty Dumpty',
        subtitle: 'A nursery rhyme about Humpty Dumpty.',
        content:
            'Humpty Dumpty sat on a wall,\nHumpty Dumpty had a great fall.\nAll the king\'s horses and all the king\'s men\nCouldn\'t put Humpty together again.',
        icon: Icons.egg_alt,
      ),
      Poem(
        title: 'Rain, rain, go away',
        subtitle: 'A nursery rhyme about rain.',
        content:
            'Rain, rain, go away,\nCome again another day.\nLittle children want to play,\nRain, rain, go away.',
        icon: Icons.water_drop,
      ),
    ];

    // Create alternating pastel colors for poem cards
    final List<List<Color>> bgColors = [
      [const Color(0xFFFFE0B2), const Color(0xFFFFF8E1)], // Light Orange
      [const Color(0xFFE1BEE7), const Color(0xFFF3E5F5)], // Light Purple
      [const Color(0xFFC8E6C9), const Color(0xFFE8F5E9)], // Light Green
      [const Color(0xFFBBDEFB), const Color(0xFFE3F2FD)], // Light Blue
      [const Color(0xFFF8BBD0), const Color(0xFFFCE4EC)], // Light Pink
      [const Color(0xFFD7CCC8), const Color(0xFFEFEBE9)], // Light Brown
    ];

    return _buildLearningScreen(
      title: 'Poems',
      themeColor: const Color(0xFF795548),
      content: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: poems.length,
        itemBuilder: (context, index) {
          return _buildEnhancedPoemCard(
            context,
            poems[index],
            const Color(0xFF795548),
            bgColors[index % bgColors.length],
          );
        },
      ),
    );
  }

  // Enhanced Poem Card
  Widget _buildEnhancedPoemCard(
    BuildContext context,
    Poem poem,
    Color color,
    List<Color> bgColors,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Card(
        elevation: 4,
        shadowColor: color.withOpacity(0.3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: InkWell(
          onTap: () {
            // Navigate to poem detail page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => PoemDetailScreen(
                      poem: poem,
                      color: color,
                      bgColors: bgColors,
                    ),
              ),
            );
          },
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: bgColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                // Background decorative elements
                Positioned(
                  right: -10,
                  bottom: -10,
                  child: Icon(
                    poem.icon,
                    size: 80,
                    color: Colors.white.withOpacity(0.3),
                  ),
                ),

                // Content
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon and title row
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(poem.icon, color: color, size: 24),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              poem.title,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: color,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // Action button
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: color.withOpacity(0.3)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.menu_book, size: 16, color: color),
                            const SizedBox(width: 4),
                            Text(
                              'Read Poem',
                              style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PoemDetailScreen extends StatefulWidget {
  final Poem poem;
  final Color color;
  final List<Color> bgColors;

  const PoemDetailScreen({
    super.key,
    required this.poem,
    required this.color,
    required this.bgColors,
  });

  @override
  State<PoemDetailScreen> createState() => _PoemDetailScreenState();
}

class _PoemDetailScreenState extends State<PoemDetailScreen>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  late AnimationController _animationController;
  int currentLine = 0;
  List<String> poemLines = [];
  bool showConfetti = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    // Split poem content into lines
    poemLines = widget.poem.content.split('\n');
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      isPlaying = !isPlaying;

      if (isPlaying) {
        _animationController.forward();
        currentLine = 0;
        _startReadingAnimation();
      } else {
        _animationController.reverse();
      }
    });
  }

  void _startReadingAnimation() {
    if (!isPlaying) return;

    // Simulate reading line by line with appropriate timing
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted && isPlaying) {
        setState(() {
          if (currentLine < poemLines.length - 1) {
            currentLine++;
            _startReadingAnimation();
          } else {
            // Finished reading
            _celebrateCompletion();
          }
        });
      }
    });
  }

  void _celebrateCompletion() {
    setState(() {
      showConfetti = true;
      isPlaying = false;
      _animationController.reverse();
    });

    // Hide confetti after a few seconds
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        setState(() {
          showConfetti = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Let's Read a Poem!",
          style: const TextStyle(
            fontFamily: 'Comic Sans MS',
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        backgroundColor: widget.color,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.auto_stories, size: 28),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background with fun pattern
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: widget.bgColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                // Header with poem title and fun icon
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: widget.color.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Icon(
                              widget.poem.icon,
                              size: 36,
                              color: widget.color,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.poem.title,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: 'Comic Sans MS',
                                    fontWeight: FontWeight.bold,
                                    color: widget.color,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  widget.poem.subtitle,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Comic Sans MS',
                                    color: widget.color.withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Poem content card with child-friendly design
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 0,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      border: Border.all(
                        color: widget.color.withOpacity(0.5),
                        width: 3,
                      ),
                    ),
                    child: Column(
                      children: [
                        // Reading progress indicator
                        if (isPlaying)
                          LinearProgressIndicator(
                            value:
                                poemLines.isEmpty
                                    ? 0
                                    : currentLine / (poemLines.length - 1),
                            backgroundColor: Colors.grey.shade200,
                            color: widget.color,
                            minHeight: 8,
                          ),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (int i = 0; i < poemLines.length; i++)
                                    Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            isPlaying && i == currentLine
                                                ? widget.bgColors[0]
                                                    .withOpacity(0.2)
                                                : Colors.transparent,
                                        borderRadius: BorderRadius.circular(12),
                                        border:
                                            isPlaying && i == currentLine
                                                ? Border.all(
                                                  color: widget.color,
                                                  width: 2,
                                                )
                                                : null,
                                      ),
                                      child: Row(
                                        children: [
                                          if (isPlaying && i == currentLine)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                right: 8.0,
                                              ),
                                              child: Icon(
                                                Icons.auto_stories,
                                                color: widget.color,
                                                size: 20,
                                              ),
                                            ),
                                          Expanded(
                                            child: Text(
                                              poemLines[i],
                                              style: TextStyle(
                                                fontSize: 22,
                                                height: 1.5,
                                                fontFamily: 'Comic Sans MS',
                                                fontWeight:
                                                    isPlaying &&
                                                            i == currentLine
                                                        ? FontWeight.bold
                                                        : FontWeight.normal,
                                                color:
                                                    isPlaying &&
                                                            i == currentLine
                                                        ? widget.color
                                                        : isPlaying &&
                                                            i < currentLine
                                                        ? Colors.grey
                                                        : Colors.black87,
                                              ),
                                            ),
                                          ),
                                          if (isPlaying && i < currentLine)
                                            const Icon(
                                              Icons.check_circle,
                                              color: Colors.green,
                                              size: 20,
                                            ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Playful controls
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: _togglePlayPause,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: widget.color,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 8,
                        ),
                        icon: AnimatedIcon(
                          icon: AnimatedIcons.play_pause,
                          progress: _animationController,
                          size: 28,
                        ),
                        label: Text(
                          isPlaying ? 'Pause Reading' : 'Read Aloud',
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Comic Sans MS',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Confetti overlay
          if (showConfetti) ConfettiOverlay(),
        ],
      ),

      // Adding colorful bottom navigation
    );
  }
}

// A simple confetti overlay effect for when poem reading is completed
class ConfettiOverlay extends StatelessWidget {
  const ConfettiOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          // Generate random confetti particles
          for (int i = 0; i < 50; i++)
            Positioned(
              left: Random().nextDouble() * MediaQuery.of(context).size.width,
              top: Random().nextDouble() * MediaQuery.of(context).size.height,
              child: TweenAnimationBuilder(
                tween: Tween<double>(
                  begin: -30,
                  end: MediaQuery.of(context).size.height,
                ),
                duration: Duration(seconds: 2 + Random().nextInt(3)),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(10 * sin(value * 0.1), value.toDouble()),
                    child: child,
                  );
                },
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation(Random().nextDouble()),
                  child: Icon(
                    [Icons.star, Icons.brightness_1, Icons.favorite][Random()
                        .nextInt(3)],
                    color:
                        [
                          Colors.red,
                          Colors.blue,
                          Colors.green,
                          Colors.yellow,
                          Colors.purple,
                          Colors.orange,
                        ][Random().nextInt(6)],
                    size: 8.0 + Random().nextDouble() * 20,
                  ),
                ),
              ),
            ),

          // Congratulations message
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.emoji_events, color: Colors.amber, size: 60),
                  const SizedBox(height: 16),
                  Text(
                    "Great Job!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Comic Sans MS',
                      color: Colors.purple,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "You finished the poem!",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Comic Sans MS',
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
