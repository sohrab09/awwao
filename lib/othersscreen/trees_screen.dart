import 'package:awwao/classes/plants_class.dart';
import 'package:flutter/material.dart';

class TreesScreen extends StatefulWidget {
  const TreesScreen({super.key});

  @override
  State<TreesScreen> createState() => _TreesScreenState();
}

class _TreesScreenState extends State<TreesScreen> {
  String searchQuery = '';
  String selectedType = 'সব';

  List<String> treeTypes = [
    'সব',
    'ফলদ',
    'ঔষধি',
    'কাঠ',
    'সৌন্দর্য্য',
    'বহুমুখী',
    'ছায়াদান',
  ];

  @override
  Widget build(BuildContext context) {
    // ফিল্টার করা গাছের তালিকা
    List<Trees> filteredTrees =
        bangladeshiTrees.where((tree) {
          bool matchesSearch =
              tree.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
              tree.scientificName.toLowerCase().contains(
                searchQuery.toLowerCase(),
              );
          bool matchesType = selectedType == 'সব' || tree.type == selectedType;
          return matchesSearch && matchesType;
        }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              'বাংলাদেশের গাছ',
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
        backgroundColor: Colors.green.shade700,
      ),
      body: Column(
        children: [
          // সার্চ এবং ফিল্টার অপশন
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.green.shade700,
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'গাছের নাম খুঁজুন...',
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
                    itemCount: treeTypes.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: FilterChip(
                          selectedColor: Colors.lightGreen.shade300,
                          backgroundColor: Colors.white,
                          label: Text(
                            treeTypes[index],
                            style: TextStyle(
                              fontWeight:
                                  selectedType == treeTypes[index]
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                          selected: selectedType == treeTypes[index],
                          onSelected: (selected) {
                            setState(() {
                              selectedType = treeTypes[index];
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

          // গাছের তালিকা
          Expanded(
            child:
                filteredTrees.isEmpty
                    ? const Center(
                      child: Text(
                        'কোন গাছ পাওয়া যায়নি!',
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
                      itemCount: filteredTrees.length,
                      itemBuilder: (context, index) {
                        final tree = filteredTrees[index];
                        return _buildTreeCard(context, tree);
                      },
                    ),
          ),
        ],
      ),
    );
  }

  Widget _buildTreeCard(BuildContext context, Trees tree) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TreeDetailScreen(tree: tree)),
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
                tree.primaryImageUrl,
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
                    tree.name,
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
                    tree.scientificName,
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
                      color: _getTypeColor(tree.type).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      tree.type,
                      style: TextStyle(
                        fontSize: 14,
                        color: _getTypeColor(tree.type),
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

  Color _getTypeColor(String type) {
    switch (type) {
      case 'ফলদ':
        return Colors.orange;
      case 'ঔষধি':
        return Colors.purple;
      case 'কাঠ':
        return Colors.brown;
      case 'সৌন্দর্য্য':
        return Colors.pink;
      case 'বহুমুখী':
        return Colors.blue;
      case 'ছায়াদান':
        return Colors.teal;
      default:
        return Colors.green;
    }
  }
}

class TreeDetailScreen extends StatefulWidget {
  final Trees tree;

  const TreeDetailScreen({super.key, required this.tree});

  @override
  State<TreeDetailScreen> createState() => _TreeDetailScreenState();
}

class _TreeDetailScreenState extends State<TreeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // গাছের ছবি দেখানো হেডার
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
                  widget.tree.name,
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
                  Image.asset(widget.tree.primaryImageUrl, fit: BoxFit.cover),
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
                  // মূল তথ্য
                  _buildInfoCard(
                    Icons.info_outline,
                    'মূল তথ্য',
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoRow(
                          'বৈজ্ঞানিক নাম',
                          widget.tree.scientificName,
                        ),
                        _buildInfoRow('গাছের ধরণ', widget.tree.type),
                        _buildInfoRow('শ্রেণী', widget.tree.category),
                        _buildInfoRow('উচ্চতা', widget.tree.height),
                        _buildInfoRow('আয়ুষ্কাল', widget.tree.lifespan),
                        _buildInfoRow('মৌসুম', widget.tree.season),
                        _buildInfoRow(
                          'বাংলাদেশে পাওয়া যায়',
                          widget.tree.isNativeToBangladesh ? 'হ্যাঁ' : 'না',
                        ),
                        _buildInfoRow(
                          'পাওয়ার স্থান',
                          widget.tree.regions.join(', '),
                        ),
                        _buildInfoRow(
                          'সংরক্ষণ অবস্থা',
                          widget.tree.conservationStatus,
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
                      widget.tree.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // উপকারিতা ও ব্যবহার
                  _buildInfoCard(
                    Icons.healing,
                    'উপকারিতা ও ব্যবহার',
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSubheading('উপকারিতা'),
                        Text(
                          widget.tree.benefits,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        _buildSubheading('ব্যবহার'),
                        Text(
                          widget.tree.uses,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // শারীরিক বৈশিষ্ট্য
                  _buildInfoCard(
                    Icons.park,
                    'শারীরিক বৈশিষ্ট্য',
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSubheading('বর্ধন অভ্যাস'),
                        Text(
                          widget.tree.growthHabit,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        _buildSubheading('পাতার বর্ণনা'),
                        Text(
                          widget.tree.leafDescription,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        _buildSubheading('ফুলের বর্ণনা'),
                        Text(
                          widget.tree.flowerDescription,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        _buildSubheading('ফলের বর্ণনা'),
                        Text(
                          widget.tree.fruitDescription,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        _buildSubheading('ছালের বর্ণনা'),
                        Text(
                          widget.tree.barkDescription,
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
                      widget.tree.interestingFacts,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // সম্পর্কিত গাছ
                  _buildInfoCard(
                    Icons.account_tree,
                    'সম্পর্কিত গাছ',
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children:
                              widget.tree.relatedTrees.map((relatedTree) {
                                return ActionChip(
                                  avatar: const Icon(Icons.park, size: 16),
                                  label: Text(relatedTree),
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
