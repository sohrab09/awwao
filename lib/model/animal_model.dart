class AnimalCategory {
  final String id;
  final String nameBn;
  final String nameEn;
  final String scientificName;

  final String mainImage;
  final List<String> imageGallery;

  final bool hasSound;
  final String? soundClip;

  final String habitat;
  final String foodHabit;
  final String description;
  final String lifeCycle;
  final String endangerment;

  AnimalCategory({
    this.id = '',
    required this.nameBn,
    required this.nameEn,
    required this.scientificName,
    required this.mainImage,
    required this.imageGallery,
    required this.hasSound,
    this.soundClip,
    required this.habitat,
    required this.foodHabit,
    required this.description,
    required this.lifeCycle,
    required this.endangerment,
  });

  factory AnimalCategory.fromJson(Map<String, dynamic> json) {
    return AnimalCategory(
      id: json['id'] ?? '',
      nameBn: json['nameBn'] ?? '',
      nameEn: json['nameEn'] ?? '',
      scientificName: json['scientificName'] ?? '',
      mainImage: json['mainImage'] ?? '',
      imageGallery: List<String>.from(json['imageGallery'] ?? []),
      hasSound: json['hasSound'] ?? false,
      soundClip: json['soundClip'] as String?,
      habitat: json['habitat'] ?? '',
      foodHabit: json['foodHabit'] ?? '',
      description: json['description'] ?? '',
      lifeCycle: json['lifeCycle'] ?? '',
      endangerment: json['endangerment'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nameBn': nameBn,
      'nameEn': nameEn,
      'scientificName': scientificName,
      'mainImage': mainImage,
      'imageGallery': imageGallery,
      'hasSound': hasSound,
      'soundClip': soundClip,
      'habitat': habitat,
      'foodHabit': foodHabit,
      'description': description,
      'lifeCycle': lifeCycle,
      'endangerment': endangerment,
    };
  }
}
