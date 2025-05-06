import 'package:flutter/material.dart';
import 'package:awwao/data/learning_content.dart';

class ShoroBornoScreen extends StatefulWidget {
  ShoroBornoScreen({Key? key}) : super(key: key);

  @override
  State<ShoroBornoScreen> createState() => _ShoroBornoScreenState();
}

class _ShoroBornoScreenState extends State<ShoroBornoScreen> {
  final data = BanglaLearningData.sworBorno;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'স্বরবর্ণ',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFFE91E63),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFCDD2), // Light pink
              Color(0xFFF8BBD0), // Pink
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Introduction text
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    'বাংলা ভাষায় ১১ টি স্বরবর্ণ আছে। চলুন এগুলো শিখি!',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 20),

                // Letter grid without animation
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      // Get the current letter data
                      final letter = data[index];
                      return _buildLetterCard(letter);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('অভ্যাস করতে এখানে ক্লিক করুন!'),
              duration: Duration(seconds: 1),
            ),
          );
        },
        backgroundColor: const Color(0xFFE91E63),
        child: const Icon(Icons.headset, color: Colors.white),
      ),
    );
  }

  Widget _buildLetterCard(Map<String, dynamic> letter) {
    return GestureDetector(
      onTap: () {
        // Play audio functionality would be here
      },
      child: Card(
        elevation: 8,
        shadowColor: Colors.pink.withOpacity(0.4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            // Background gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    const Color(0xFFF8BBD0).withOpacity(0.3),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            // Letter content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Large letter display
                  Text(
                    letter['letter']!,
                    style: const TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE91E63),
                    ),
                  ),

                  // const SizedBox(height: 8),

                  // Example word
                  Text(
                    letter['example']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // Sound indicator
            Positioned(
              top: 8,
              right: 8,
              child: Icon(
                Icons.volume_up_rounded,
                size: 20,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
