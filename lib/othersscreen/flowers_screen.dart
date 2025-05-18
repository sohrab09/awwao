import 'package:awwao/classes/flowers_class.dart';
import 'package:flutter/material.dart';

class FlowersScreen extends StatefulWidget {
  const FlowersScreen({super.key});

  @override
  State<FlowersScreen> createState() => _FlowersScreenState();
}

class _FlowersScreenState extends State<FlowersScreen> {
  String searchQuery = '';
  String selectedType = 'সব';

  List<String> flowerTypes = ['সব', 'বার্ষিক', 'বহুবর্ষজীবী', 'দেশি', 'বিদেশি'];

  @override
  Widget build(BuildContext context) {
    // ফিল্টার করা ফুলের তালিকা
    List<Flower> filteredFlowers =
        flower.where((flower) {
          bool matchesSearch =
              flower.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
              flower.scientificName.toLowerCase().contains(
                searchQuery.toLowerCase(),
              );
          // Handle both category and type filtering
          bool matchesType =
              selectedType == 'সব' ||
              flower.type == selectedType ||
              flower.category == selectedType;
          return matchesSearch && matchesType;
        }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              'বাংলাদেশের ফুল',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.pink.shade700,
      ),
      body: Column(
        children: [
          // সার্চ এবং ফিল্টার অপশন
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.pink.shade700,
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'ফুলের নাম খুঁজুন...',
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
                    itemCount: flowerTypes.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: FilterChip(
                          selectedColor: Colors.pink.shade300,
                          backgroundColor: Colors.white,
                          label: Text(
                            flowerTypes[index],
                            style: TextStyle(
                              fontWeight:
                                  selectedType == flowerTypes[index]
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                          selected: selectedType == flowerTypes[index],
                          onSelected: (selected) {
                            setState(() {
                              selectedType = flowerTypes[index];
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

          // ফুলের তালিকা
          Expanded(
            child:
                filteredFlowers.isEmpty
                    ? const Center(
                      child: Text(
                        'কোন ফুল পাওয়া যায়নি!',
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
                      itemCount: filteredFlowers.length,
                      itemBuilder: (context, index) {
                        final flower = filteredFlowers[index];
                        return _buildFlowerCard(context, flower);
                      },
                    ),
          ),
        ],
      ),
    );
  }

  Widget _buildFlowerCard(BuildContext context, Flower flower) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FlowerDetailScreen(flower: flower),
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
                flower.primaryImageUrl,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    flower.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    flower.scientificName,
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey.shade700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: _getTypeColor(flower.type).withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          flower.type,
                          style: TextStyle(
                            fontSize: 12,
                            color: _getTypeColor(flower.type),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: _getCategoryColor(
                            flower.category,
                          ).withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          flower.category,
                          style: TextStyle(
                            fontSize: 12,
                            color: _getCategoryColor(flower.category),
                            fontWeight: FontWeight.bold,
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

  Color _getTypeColor(String type) {
    switch (type) {
      case 'বার্ষিক':
        return Colors.orange;
      case 'বহুবর্ষজীবী':
        return Colors.teal;
      default:
        return Colors.pink;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'দেশি':
        return Colors.green;
      case 'বিদেশি':
        return Colors.blue;
      default:
        return Colors.pink;
    }
  }
}

class FlowerDetailScreen extends StatefulWidget {
  final Flower flower;

  const FlowerDetailScreen({super.key, required this.flower});

  @override
  State<FlowerDetailScreen> createState() => _FlowerDetailScreenState();
}

class _FlowerDetailScreenState extends State<FlowerDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ফুলের ছবি দেখানো হেডার
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
                  widget.flower.name,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Hind Siliguri',
                    letterSpacing: 1,
                  ),
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(widget.flower.primaryImageUrl, fit: BoxFit.cover),
                ],
              ),
            ),
          ),

          // বিস্তারিত তথ্য
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ইমেজ গ্যালারি
                  if (widget.flower.imageGallery.isNotEmpty)
                    _buildInfoCard(
                      Icons.photo_library,
                      'ছবির গ্যালারি',
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.flower.imageGallery.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  widget.flower.imageGallery[index],
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                  if (widget.flower.imageGallery.isNotEmpty)
                    const SizedBox(height: 16),

                  // মূল তথ্য
                  _buildInfoCard(
                    Icons.info_outline,
                    'মূল তথ্য',
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoRow(
                          'বৈজ্ঞানিক নাম',
                          widget.flower.scientificName,
                        ),
                        _buildInfoRow('ফুলের ধরণ', widget.flower.type),
                        _buildInfoRow('শ্রেণী', widget.flower.category),
                        _buildInfoRow('রং', widget.flower.color),
                        _buildInfoRow('সুগন্ধ', widget.flower.fragrance),
                        _buildInfoRow('উচ্চতা', widget.flower.height),
                        _buildInfoRow('আয়ুষ্কাল', widget.flower.lifespan),
                        _buildInfoRow('ফোটার সময়', widget.flower.bloomTime),
                        _buildInfoRow(
                          'বাংলাদেশে পাওয়া যায়',
                          widget.flower.isNativeToBangladesh ? 'হ্যাঁ' : 'না',
                        ),
                        _buildInfoRow(
                          'পাওয়ার স্থান',
                          widget.flower.regions.join(', '),
                        ),
                        _buildInfoRow(
                          'সংরক্ষণ অবস্থা',
                          widget.flower.conservationStatus,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // বিবরণ
                  _buildInfoCard(
                    Icons.description,
                    'বিবরণ',
                    Text(
                      widget.flower.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // প্রতীকী অর্থ ও ব্যবহার
                  _buildInfoCard(
                    Icons.spa,
                    'প্রতীকী অর্থ ও ব্যবহার',
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSubheading('প্রতীকী অর্থ'),
                        Text(
                          widget.flower.symbolism,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        _buildSubheading('ব্যবহার'),
                        Text(
                          widget.flower.uses,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // শারীরিক বৈশিষ্ট্য
                  _buildInfoCard(
                    Icons.nature,
                    'শারীরিক বৈশিষ্ট্য',
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSubheading('বর্ধন অভ্যাস'),
                        Text(
                          widget.flower.growthHabit,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        _buildSubheading('পাতার বর্ণনা'),
                        Text(
                          widget.flower.leafDescription,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        _buildSubheading('ফুলের বর্ণনা'),
                        Text(
                          widget.flower.flowerDescription,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        _buildSubheading('প্রাকৃতিক বাসস্থান'),
                        Text(
                          widget.flower.habitat,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // মজার তথ্য
                  _buildInfoCard(
                    Icons.lightbulb_outline,
                    'মজার তথ্য',
                    Text(
                      widget.flower.interestingFacts,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // সম্পর্কিত ফুল
                  _buildInfoCard(
                    Icons.account_tree,
                    'সম্পর্কিত ফুল',
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children:
                              widget.flower.relatedFlowers.map((relatedFlower) {
                                return ActionChip(
                                  avatar: const Icon(
                                    Icons.local_florist,
                                    size: 16,
                                    color: Colors.pink,
                                  ),
                                  label: Text(relatedFlower),
                                  backgroundColor: Colors.pink.shade50,
                                );
                              }).toList(),
                        ),
                      ],
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
                Icon(icon, color: Colors.pink, size: 24),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
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
          color: Colors.pink,
        ),
      ),
    );
  }
}
