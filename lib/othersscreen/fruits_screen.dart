import 'package:awwao/classes/fruits_class.dart';
import 'package:flutter/material.dart';

class FruitsScreen extends StatefulWidget {
  const FruitsScreen({super.key});

  @override
  State<FruitsScreen> createState() => _FruitsScreenState();
}

class _FruitsScreenState extends State<FruitsScreen> {
  String searchQuery = '';
  String selectedCategory = 'সব';

  List<String> fruitCategories = [
    'সব',
    'গ্রীষ্মকালীন',
    'শীতকালীন',
    'সারা বছর',
    'বাংলাদেশী',
    'বিদেশী',
  ];

  @override
  Widget build(BuildContext context) {
    // Filtered fruits list
    List<Fruit> filteredFruits =
        createFruitsList().where((fruit) {
          bool matchesSearch =
              fruit.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
              fruit.scientificName.toLowerCase().contains(
                searchQuery.toLowerCase(),
              );
          bool matchesCategory =
              selectedCategory == 'সব' ||
              (selectedCategory == 'বাংলাদেশী' && fruit.isNativeToBangladesh) ||
              (selectedCategory == 'বিদেশী' && !fruit.isNativeToBangladesh) ||
              (selectedCategory == 'গ্রীষ্মকালীন' &&
                  fruit.season.contains('গ্রীষ্ম')) ||
              (selectedCategory == 'শীতকালীন' &&
                  fruit.season.contains('শীত')) ||
              (selectedCategory == 'সারা বছর' &&
                  fruit.season.contains('সারা বছর'));
          return matchesSearch && matchesCategory;
        }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'বাংলাদেশের ফল',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        // centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFF6A1B9A),
      ),
      body: Column(
        children: [
          // Search and filter options
          Container(
            padding: const EdgeInsets.all(16),
            color: Color(0xFF6A1B9A),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'ফলের নাম খুঁজুন...',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: fruitCategories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: FilterChip(
                          selectedColor: Colors.purple.shade200,
                          backgroundColor: Colors.white,
                          label: Text(
                            fruitCategories[index],
                            style: TextStyle(
                              fontWeight:
                                  selectedCategory == fruitCategories[index]
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                          selected: selectedCategory == fruitCategories[index],
                          onSelected: (selected) {
                            setState(() {
                              selectedCategory = fruitCategories[index];
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Fruits list
          Expanded(
            child:
                filteredFruits.isEmpty
                    ? const Center(
                      child: Text(
                        'কোন ফল পাওয়া যায়নি!',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                    : GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                      itemCount: filteredFruits.length,
                      itemBuilder: (context, index) {
                        final fruit = filteredFruits[index];
                        return _buildFruitCard(context, fruit);
                      },
                    ),
          ),
        ],
      ),
    );
  }

  Widget _buildFruitCard(BuildContext context, Fruit fruit) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FruitDetailScreen(fruit: fruit),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.asset(
                fruit.primaryImageUrl,
                height: 140,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 140,
                    color: Colors.green.shade100,
                    child: const Icon(Icons.eco, size: 50, color: Colors.green),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fruit.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    fruit.scientificName,
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey.shade700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getCategoryColor(fruit).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      _getCategoryText(fruit),
                      style: TextStyle(
                        fontSize: 14,
                        color: _getCategoryColor(fruit),
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
    );
  }

  Color _getCategoryColor(Fruit fruit) {
    if (!fruit.isNativeToBangladesh) return Colors.purple;
    if (fruit.season.contains('গ্রীষ্ম')) return Colors.orange;
    if (fruit.season.contains('শীত')) return Colors.blue;
    return Colors.green;
  }

  String _getCategoryText(Fruit fruit) {
    if (!fruit.isNativeToBangladesh) return 'বিদেশী';
    if (fruit.season.contains('গ্রীষ্ম')) return 'গ্রীষ্মকালীন';
    if (fruit.season.contains('শীত')) return 'শীতকালীন';
    return 'সারা বছর';
  }
}

class FruitDetailScreen extends StatefulWidget {
  final Fruit fruit;

  const FruitDetailScreen({super.key, required this.fruit});

  @override
  State<FruitDetailScreen> createState() => _FruitDetailScreenState();
}

class _FruitDetailScreenState extends State<FruitDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Fruit image header
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  widget.fruit.name,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    widget.fruit.primaryImageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.green.shade100,
                        child: const Icon(
                          Icons.eco,
                          size: 80,
                          color: Colors.green,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // Detailed information
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Basic information
                  _buildInfoCard(
                    Icons.info_outline,
                    'মূল তথ্য',
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoRow(
                          'বৈজ্ঞানিক নাম',
                          widget.fruit.scientificName,
                        ),
                        _buildInfoRow('ধরণ', widget.fruit.type),
                        _buildInfoRow('শ্রেণী', widget.fruit.category),
                        _buildInfoRow('উচ্চতা', widget.fruit.height),
                        _buildInfoRow('আয়ুষ্কাল', widget.fruit.lifespan),
                        _buildInfoRow('মৌসুম', widget.fruit.season),
                        _buildInfoRow(
                          'বাংলাদেশী ফল',
                          widget.fruit.isNativeToBangladesh ? 'হ্যাঁ' : 'না',
                        ),
                        _buildInfoRow(
                          'পাওয়ার স্থান',
                          widget.fruit.regions.join(', '),
                        ),
                        _buildInfoRow(
                          'সংরক্ষণ অবস্থা',
                          widget.fruit.conservationStatus,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Description
                  _buildInfoCard(
                    Icons.description,
                    'বিবরণ',
                    Text(
                      widget.fruit.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Benefits and uses
                  _buildInfoCard(
                    Icons.health_and_safety,
                    'উপকারিতা ও ব্যবহার',
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSubheading('উপকারিতা'),
                        Text(
                          widget.fruit.benefits,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        _buildSubheading('ব্যবহার'),
                        Text(
                          widget.fruit.uses,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Physical characteristics
                  _buildInfoCard(
                    Icons.park,
                    'শারীরিক বৈশিষ্ট্য',
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSubheading('বৃদ্ধির ধরন'),
                        Text(
                          widget.fruit.growthHabit,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        _buildSubheading('পাতার বর্ণনা'),
                        Text(
                          widget.fruit.leafDescription,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        _buildSubheading('ফুলের বর্ণনা'),
                        Text(
                          widget.fruit.flowerDescription,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        _buildSubheading('ফলের বর্ণনা'),
                        Text(
                          widget.fruit.fruitDescription,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        _buildSubheading('ছালের বর্ণনা'),
                        Text(
                          widget.fruit.barkDescription,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Habitat and growth
                  _buildInfoCard(
                    Icons.landscape,
                    'বাসস্থান ও চাষ',
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSubheading('বাসস্থান'),
                        Text(
                          widget.fruit.habitat,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        _buildSubheading('চাষ পদ্ধতি'),
                        Text(
                          widget.fruit.growthHabit,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Interesting facts
                  _buildInfoCard(
                    Icons.lightbulb_outline,
                    'মজার তথ্য',
                    Text(
                      widget.fruit.interestingFacts,
                      style: const TextStyle(fontSize: 16),
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

  Widget _buildInfoCard(IconData icon, String title, Widget content) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.green, size: 24),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }

  Widget _buildSubheading(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
    );
  }
}
