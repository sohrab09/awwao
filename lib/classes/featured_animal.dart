class FeaturedAnimal {
  final String id;
  final String name;
  final String category;
  final String image;
  final String sound;
  final bool hasSound;

  FeaturedAnimal({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.sound,
    required this.hasSound,
  });

  // Factory constructor to create an object from a map (e.g., from the mock data)
  factory FeaturedAnimal.fromMap(Map<String, dynamic> map) {
    return FeaturedAnimal(
      id: map['id'],
      name: map['name'],
      category: map['category'],
      image: map['image'],
      sound: map['sound'],
      hasSound: map['hasSound'],
    );
  }
}

class FeaturedAnimals {
  // List of featured animals
  final List<FeaturedAnimal> animals;

  FeaturedAnimals({required this.animals});

  // Method to get all animals from the mock data
  static FeaturedAnimals fromMockData(List<Map<String, dynamic>> mockData) {
    List<FeaturedAnimal> animals =
        mockData.map((data) {
          return FeaturedAnimal.fromMap(data);
        }).toList();

    return FeaturedAnimals(animals: animals);
  }
}

// Example usage with the mock data
final List<Map<String, dynamic>> featuredAnimalsMockData = const [
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
    'id': '5',
    'name': 'ঘোড়া',
    'category': 'প্রাণী',
    'image': 'assets/images/horse.jpg',
    'sound': 'sounds/horse.mp3',
    'hasSound': true,
  },
];

// To access the animals list
final featuredAnimals = FeaturedAnimals.fromMockData(featuredAnimalsMockData);
