import 'package:flutter/material.dart';
import 'package:awwao/data/learning_content.dart';

class BanglaNumberScreen extends StatelessWidget {
  final data = BanglaLearningData.numbers;

  BanglaNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'সংখ্যা',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF4C87AF),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFBBDEFB), // Light blue
              Color(0xFFE3F2FD), // Lighter blue
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
                        color: Color(0xFFE3F2FD).withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    'বাংলা সংখ্যাগুলো শিখি সহজেই!',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 20),

                // Number grid
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
                      final item = data[index];
                      return _buildNumberCard(item);
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
              content: Text('সংখ্যা অনুশীলন করতে এখানে ক্লিক করুন!'),
              duration: Duration(seconds: 1),
            ),
          );
        },
        backgroundColor: const Color(0xFF4C87AF),
        child: const Icon(Icons.headset, color: Colors.white),
      ),
    );
  }

  Widget _buildNumberCard(Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () {
        // Audio or interactivity can be added here
      },
      child: Card(
        elevation: 8,
        shadowColor: Color(0xFFE3F2FD).withOpacity(0.4),
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
                    const Color(0xFFE3F2FD).withOpacity(0.3),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            // Number content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item['bangla']!,
                    style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF249DF3),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${item['english']} - ${item['banglaWord']}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Sound icon
            Positioned(
              top: 8,
              right: 8,
              child: Icon(
                Icons.volume_up_rounded,
                size: 20,
                color: const Color.fromARGB(255, 81, 179, 236),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
