import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awwao/model/animal_model.dart';
import 'package:awwao/othersscreen/animal_details_screen.dart';

class AnimalsScreen extends StatefulWidget {
  const AnimalsScreen({super.key});

  @override
  _AnimalsScreenState createState() => _AnimalsScreenState();
}

class _AnimalsScreenState extends State<AnimalsScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String searchQuery = '';
  String selectedConservationStatus = 'সব';
  bool _isLoading = true;
  List<AnimalCategory> _allAnimals = [];

  List<String> conservationStatuses = [
    'সব',
    'অতি বিপন্ন',
    'সংরক্ষিত',
    'আংশিক বিপন্ন',
    'সাধারণ',
    'হুমকির মুখে',
  ];

  @override
  void initState() {
    super.initState();
    _fetchAnimals();
  }

  Future<void> _fetchAnimals() async {
    try {
      final snapshot = await _firestore.collection('animals').get();
      final animals =
          snapshot.docs
              .map((doc) => AnimalCategory.fromJson(doc.data()))
              .whereType<AnimalCategory>()
              .toList();

      setState(() {
        _allAnimals = animals;
        _isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredAnimals =
        _allAnimals.where((animal) {
          final matchesSearch =
              animal.nameBn.contains(searchQuery) ||
              animal.nameEn.toLowerCase().contains(searchQuery.toLowerCase());
          final matchesStatus =
              selectedConservationStatus == 'সব' ||
              animal.endangerment == selectedConservationStatus;
          return matchesSearch && matchesStatus;
        }).toList();

    return Scaffold(
      backgroundColor: Colors.yellow.shade50,
      appBar: AppBar(
        backgroundColor: Colors.orange.shade400,
        title: const Text(
          'প্রাণী পরিচিতি',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.orange.shade100,
            child: Column(
              children: [
                TextField(
                  onChanged: (val) => setState(() => searchQuery = val),
                  decoration: InputDecoration(
                    hintText: 'প্রাণীর নাম লিখুন...',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 45,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: conservationStatuses.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      final status = conservationStatuses[index];
                      final isSelected = selectedConservationStatus == status;
                      return ChoiceChip(
                        selected: isSelected,
                        label: Text(status),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : Colors.black87,
                        ),
                        selectedColor: Colors.deepOrange,
                        backgroundColor: Colors.white,
                        onSelected:
                            (_) => setState(() {
                              selectedConservationStatus = status;
                            }),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child:
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : filteredAnimals.isEmpty
                    ? const Center(
                      child: Text(
                        'কোনো প্রাণী পাওয়া যায়নি!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                    : GridView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: filteredAnimals.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.72,
                          ),
                      itemBuilder: (context, index) {
                        final animal = filteredAnimals[index];
                        return _buildAnimalCard(animal);
                      },
                    ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimalCard(AnimalCategory animal) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => AnimalDetailScreen(animal: animal)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.shade100,
              blurRadius: 6,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
              child:
                  animal.mainImage.isNotEmpty
                      ? Image.network(
                        animal.mainImage,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        loadingBuilder:
                            (_, child, progress) =>
                                progress == null
                                    ? child
                                    : const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                        errorBuilder:
                            (_, __, ___) => const Center(
                              child: Icon(Icons.broken_image, size: 50),
                            ),
                      )
                      : const Center(
                        child: Icon(Icons.image_not_supported, size: 60),
                      ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      animal.nameBn,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.deepOrange,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      animal.nameEn,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _getConservationStatusColor(
                          animal.endangerment,
                        ).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        animal.endangerment,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: _getConservationStatusColor(
                            animal.endangerment,
                          ),
                        ),
                      ),
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

  Color _getConservationStatusColor(String status) {
    switch (status) {
      case 'অতি বিপন্ন':
        return Colors.red.shade800;
      case 'সংরক্ষিত':
        return Colors.orange;
      case 'আংশিক বিপন্ন':
        return Colors.purple;
      case 'সাধারণ':
        return Colors.green;
      case 'হুমকির মুখে':
        return Colors.redAccent;
      default:
        return Colors.grey;
    }
  }
}
