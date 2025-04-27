import 'package:awwao/screens/category_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:awwao/classes/categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeCategory = 1;
  final TextEditingController _searchController = TextEditingController();
  final AudioPlayer _audioPlayer = AudioPlayer();

  bool isSoundOn = true;
  int? _currentlyPlayingIndex;
  bool _isPlaying = false;

  // Mock data for featured animals
  final List<Map<String, dynamic>> featuredAnimals = const [
    {
      'id': '1',
      'name': 'দোয়েল',
      'category': 'পাখি',
      'image': 'assets/images/doel.jpg',
      'sound': 'sounds/doel.mp3',
      'hasSound': true,
    },
    {
      'id': '2',
      'name': 'বাঘ',
      'category': 'প্রাণী',
      'image': 'assets/images/tiger.jpg',
      'sound': 'sounds/tiger.mp3',
      'hasSound': true,
    },
    {
      'id': '3',
      'name': 'ময়না',
      'category': 'পাখি',
      'image': 'assets/images/moyna.jpg',
      'sound': 'sounds/moyna.mp3',
      'hasSound': true,
    },
    {
      'id': '4',
      'name': 'হাতি',
      'category': 'প্রাণী',
      'image': 'assets/images/elephant.jpg',
      'sound': 'sounds/elephant.mp3',
      'hasSound': true,
    },
    {
      'id': '4',
      'name': 'ঘোড়া',
      'category': 'প্রাণী',
      'image': 'assets/images/horse.jpg',
      'sound': 'sounds/horse.mp3',
      'hasSound': true,
    },
  ];

  // Mock data for recently viewed animals
  final List<Map<String, dynamic>> recentlyViewed = [
    {
      'id': '1',
      'name': 'ঈগল',
      'category': 'পাখি',
      'image': 'assets/images/eagle.jpg',
    },
    {
      'id': '2',
      'name': 'সিংহ',
      'category': 'প্রাণী',
      'image': 'assets/images/lion.jpg',
    },
    {
      'id': '3',
      'name': 'কাক',
      'category': 'পাখি',
      'image': 'assets/images/crow.jpg',
    },
    {
      'id': '4',
      'name': 'গরু',
      'category': 'প্রাণী',
      'image': 'assets/images/cow.jpg',
    },
    {
      'id': '5',
      'name': 'ঘোড়া',
      'category': 'প্রাণী',
      'image': 'assets/images/horse.jpg',
    },
    {
      'id': '6',
      'name': 'টিয়া',
      'category': 'পাখি',
      'image': 'assets/images/parrot.jpg',
    },
    {
      'id': '7',
      'name': 'শিয়াল',
      'category': 'প্রাণী',
      'image': 'assets/images/fox.jpg',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),

            // Search bar
            _buildSearchBar(),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Categories section
                    _buildCategoriesSection(),

                    // Featured animals section
                    _buildFeaturedAnimalsSection(),

                    // Recently viewed section
                    _buildRecentlyViewedSection(),

                    // Did you know section
                    _buildDidYouKnowSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'স্বাগতম!',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 4),
              const Text(
                'পাখি ও প্রাণীর সম্পর্কে জানতে আগ্রহী হওয়াতে আপনাকে ধন্যবাদ!',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'অনুসন্ধান করুন...',
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            suffixIcon:
                _searchController.text.isNotEmpty
                    ? IconButton(
                      icon: const Icon(Icons.clear, color: Colors.grey),
                      onPressed: () {
                        setState(() {
                          _searchController.clear();
                        });
                      },
                    )
                    : null,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
          ),
          onChanged: (value) {
            setState(() {});
          },
        ),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'বিভাগ সমূহ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final isActive = category.id == activeCategory;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    activeCategory = category.id;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              CategoryDetailsScreen(category: category),
                    ),
                  );
                },
                child: Container(
                  width: 80,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: isActive ? Colors.green : Colors.green.shade50,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          category.icon,
                          color: isActive ? Colors.white : Colors.green,
                          size: 30,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        category.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight:
                              isActive ? FontWeight.bold : FontWeight.normal,
                          color: isActive ? Colors.green : Colors.black87,
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
    );
  }

  Widget _buildFeaturedAnimalsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 24.0,
            bottom: 12.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'বিশেষ প্রাণী',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('সব প্রাণী দেখানো হবে।')),
                  );
                },
                child: const Text(
                  'সব দেখুন',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 210,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: featuredAnimals.length,
            itemBuilder: (context, index) {
              final animal = featuredAnimals[index];

              return Container(
                width: 160,
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.asset(
                        animal['image'],
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 120,
                            width: double.infinity,
                            color: Colors.grey.shade200,
                            child: Icon(
                              Icons.broken_image,
                              size: 50,
                              color: Colors.grey.shade400,
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  animal['name'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              if (animal['hasSound'])
                                GestureDetector(
                                  onTap: () async {
                                    final soundFileName = '${animal['sound']}';

                                    if (_currentlyPlayingIndex == index &&
                                        _isPlaying) {
                                      // Pause the sound
                                      await _audioPlayer.pause();
                                      setState(() {
                                        _isPlaying = false;
                                      });
                                    } else {
                                      try {
                                        await _audioPlayer
                                            .stop(); // Stop previous if any
                                        await _audioPlayer.play(
                                          AssetSource(soundFileName),
                                        );
                                        setState(() {
                                          _currentlyPlayingIndex = index;
                                          _isPlaying = true;
                                        });
                                      } catch (e) {
                                        print('Sound play error: $e');
                                      }
                                    }
                                  },
                                  child: Icon(
                                    Icons.volume_up,
                                    size: 20,
                                    color:
                                        (_currentlyPlayingIndex == index &&
                                                _isPlaying)
                                            ? Colors.red
                                            : Colors.green,
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            animal['category'],
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRecentlyViewedSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'সম্প্রতি দেখা',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to history screen
                  },
                  child: const Text(
                    'সব দেখুন',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.85,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: recentlyViewed.length,
            itemBuilder: (context, index) {
              final animal = recentlyViewed[index];

              return GestureDetector(
                onTap: () {
                  // Navigate to animal details screen
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 3,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Placeholder for animal image
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: Container(
                            width: double.infinity,
                            color: Colors.grey.shade200,
                            child: Image.asset(
                              animal['image'],
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 120,
                                  width: double.infinity,
                                  color: Colors.grey.shade200,
                                  child: Icon(
                                    Icons.broken_image,
                                    size: 50,
                                    color: Colors.grey.shade400,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          animal['name'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDidYouKnowSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.lightbulb, color: Colors.amber.shade600),
                const SizedBox(width: 8),
                const Text(
                  'আপনি কি জানেন?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'বাংলাদেশে প্রায় ৬৫০ প্রজাতির পাখি দেখা যায়, যার মধ্যে ২৮০ প্রজাতি স্থানীয় এবং বাকিরা অতিথি পাখি।',
              style: TextStyle(fontSize: 14, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
