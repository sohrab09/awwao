import 'package:flutter/material.dart';
import 'package:awwao/data/learning_content.dart';

class BanjonBornoScreen extends StatefulWidget {
  const BanjonBornoScreen({super.key});

  @override
  State<BanjonBornoScreen> createState() => _BanjonBornoScreenState();
}

class _BanjonBornoScreenState extends State<BanjonBornoScreen> {
  final data = BanglaLearningData.banjonBorno;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ব্যঞ্জনবর্ণ',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF2196F3),
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
                        color: Colors.blue.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    'বাংলা ভাষায় ৩৯টি ব্যঞ্জনবর্ণ আছে। চলুন এগুলো শিখি!',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 20),

                // Letter grid
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
        backgroundColor: const Color(0xFF2196F3),
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
        shadowColor: Colors.blue.withOpacity(0.4),
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
                    const Color(0xFFBBDEFB).withOpacity(0.3),
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
                  Text(
                    letter['letter']!,
                    style: const TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2196F3),
                    ),
                  ),
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

            // Sound icon
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
