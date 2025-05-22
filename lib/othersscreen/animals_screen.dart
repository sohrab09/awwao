import 'package:awwao/othersscreen/animal_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awwao/model/animal_model.dart';

class AnimalsScreen extends StatefulWidget {
  const AnimalsScreen({super.key});

  @override
  _AnimalsScreenState createState() => _AnimalsScreenState();
}

class _AnimalsScreenState extends State<AnimalsScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String searchQuery = '';
  String selectedConservationStatus = 'সব';
  List<String> conservationStatuses = [
    'সব',
    'অতি বিপন্ন',
    'সংরক্ষিত',
    'আংশিক বিপন্ন',
    'সাধারণ',
    'হুমকির মুখে',
  ];

  bool _isLoading = true;
  List<AnimalCategory> _allAnimals = [];

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
              .map((doc) {
                final data = doc.data() as Map<String, dynamic>?;
                if (data == null) return null;
                return AnimalCategory.fromJson(data);
              })
              .whereType<AnimalCategory>()
              .toList();

      setState(() {
        _allAnimals = animals;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching animals: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<AnimalCategory> filteredAnimals =
        _allAnimals.where((animal) {
          bool matchesSearch =
              animal.nameEn.toLowerCase().contains(searchQuery.toLowerCase()) ||
              animal.nameBn.toLowerCase().contains(searchQuery.toLowerCase());
          bool matchesConservationStatus =
              selectedConservationStatus == 'সব' ||
              animal.endangerment == selectedConservationStatus;
          return matchesSearch && matchesConservationStatus;
        }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'প্রাণী পরিচিতি',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.teal.shade700,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.teal.shade700,
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'প্রাণীর নাম খুঁজুন...',
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
                    itemCount: conservationStatuses.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: FilterChip(
                          selectedColor: Colors.teal.shade300,
                          backgroundColor: Colors.white,
                          label: Text(
                            conservationStatuses[index],
                            style: TextStyle(
                              fontWeight:
                                  selectedConservationStatus ==
                                          conservationStatuses[index]
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                          selected:
                              selectedConservationStatus ==
                              conservationStatuses[index],
                          onSelected: (selected) {
                            setState(() {
                              selectedConservationStatus =
                                  conservationStatuses[index];
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
          Expanded(
            child:
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : filteredAnimals.isEmpty
                    ? const Center(
                      child: Text(
                        'কোন প্রাণী পাওয়া যায়নি!',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                    : GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                      itemCount: filteredAnimals.length,
                      itemBuilder: (context, index) {
                        final animal = filteredAnimals[index];
                        return _buildAnimalCard(context, animal);
                      },
                    ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimalCard(BuildContext context, AnimalCategory animal) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AnimalDetailScreen(animal: animal),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              child:
                  animal.mainImage.isNotEmpty
                      ? Image.network(
                        animal.mainImage,
                        height: 140,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder:
                            (context, error, stackTrace) => const Center(
                              child: Icon(
                                Icons.image_not_supported,
                                size: 50,
                                color: Colors.grey,
                              ),
                            ),
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value:
                                  loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                              color: Colors.teal,
                            ),
                          );
                        },
                      )
                      : const Center(
                        child: Icon(
                          Icons.image_not_supported,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      animal.nameEn,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      animal.nameBn,
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey.shade700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _getConservationStatusColor(
                          animal.endangerment,
                        ).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        animal.endangerment,
                        style: TextStyle(
                          fontSize: 12,
                          color: _getConservationStatusColor(
                            animal.endangerment,
                          ),
                          fontWeight: FontWeight.bold,
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
        return Colors.orange.shade700;
      case 'সংরক্ষিত':
        return Colors.yellow.shade800;
      case 'আংশিক বিপন্ন':
        return Colors.red.shade700;
      case 'সাধারণ':
        return Colors.green.shade700;
      case 'হুমকির মুখে':
        return Colors.red.shade900;
      default:
        return Colors.blueGrey;
    }
  }
}
