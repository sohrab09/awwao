import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:awwao/model/animal_model.dart';

class AnimalDetailScreen extends StatefulWidget {
  final AnimalCategory animal;

  const AnimalDetailScreen({super.key, required this.animal});

  @override
  _AnimalDetailScreenState createState() => _AnimalDetailScreenState();
}

class _AnimalDetailScreenState extends State<AnimalDetailScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playSound(String audioUrl) async {
    try {
      // If already playing, stop it
      if (_isPlaying) {
        await _audioPlayer.stop();
        setState(() {
          _isPlaying = false;
        });
        return;
      }

      // Play new sound
      await _audioPlayer.play(UrlSource(audioUrl));
      setState(() {
        _isPlaying = true;
      });

      // Add listener to update state when audio completes
      _audioPlayer.onPlayerComplete.listen((event) {
        setState(() {
          _isPlaying = false;
        });
      });
    } catch (e) {
      print('Error playing sound from $audioUrl: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to play sound.'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final animal = widget.animal;

    return Scaffold(
      backgroundColor:
          Colors.lightBlue.shade50, // Light, child-friendly background
      appBar: AppBar(
        title: Text(
          animal.nameEn,
          style: const TextStyle(
            fontSize: 26, // Larger font for title
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'BubblegumSans', // Example of a playful font
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent, // Bright app bar
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30,
        ), // White back icon
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20), // Add some bottom padding
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Center content horizontally
          children: [
            // Hero image at the top with rounded corners and shadow
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 280, // Slightly taller image
                  width: double.infinity,
                  child:
                      animal.mainImage.isNotEmpty
                          ? Image.network(
                            animal.mainImage,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) => const Center(
                                  child: Icon(
                                    Icons.image_not_supported,
                                    size: 120,
                                    color: Colors.grey,
                                  ),
                                ),
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value:
                                      loadingProgress.expectedTotalBytes != null
                                          ? loadingProgress
                                                  .cumulativeBytesLoaded /
                                              loadingProgress
                                                  .expectedTotalBytes!
                                          : null,
                                  color: Colors.blueAccent,
                                ),
                              );
                            },
                          )
                          : const Center(
                            child: Icon(
                              Icons.image_not_supported,
                              size: 120,
                              color: Colors.grey,
                            ),
                          ),
                ),
              ),
            ),

            // Sound button (more prominent and playful)
            if (animal.hasSound &&
                animal.soundClip != null &&
                animal.soundClip!.isNotEmpty)
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton.icon(
                  icon: Icon(
                    _isPlaying ? Icons.stop_circle : Icons.volume_up_rounded,
                    size: 40, // Larger icon
                  ),
                  label: Text(
                    _isPlaying
                        ? 'আওয়াজ বন্ধ করুন!'
                        : 'আওয়াজ শুনুন!', // Bengali text for kids
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'NotoSansBengali', // For Bengali text
                    ),
                  ),
                  onPressed: () => _playSound(animal.soundClip!),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _isPlaying
                            ? Colors.redAccent
                            : Colors.green, // Change color based on state
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded button
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    elevation: 8,
                  ),
                ),
              ),

            // Names section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // Center names
                children: [
                  Text(
                    animal.nameEn,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 34, // Very large font for English name
                      fontWeight: FontWeight.w900, // Extra bold
                      color: Colors.deepPurple, // Fun color
                      fontFamily: 'BubblegumSans',
                    ),
                  ),
                  Text(
                    '(${animal.nameBn})', // Bengali name in parenthesis
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      color: Colors.teal.shade700, // Different color
                      fontFamily: 'NotoSansBengali',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'বৈজ্ঞানিক নাম: ${animal.scientificName}', // Bengali text
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blueGrey[600],
                      fontStyle: FontStyle.italic,
                      fontFamily: 'NotoSansBengali',
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
              thickness: 1.5,
              height: 30,
              color: Colors.blueGrey,
            ),

            // Endangerment status (more visual)
            _buildStatusBadge(animal.endangerment),

            // Information sections
            _buildInfoSection(
              'বাসস্থান',
              animal.habitat,
              Icons.home_rounded,
            ), // Bengali title with icon
            _buildInfoSection(
              'খাদ্য অভ্যাস',
              animal.foodHabit,
              Icons.restaurant_menu,
            ), // Bengali title with icon
            _buildInfoSection(
              'পরিচিতি',
              animal.description,
              Icons.info_outline,
            ), // Bengali title with icon
            _buildInfoSection(
              'জীবনচক্র',
              animal.lifeCycle,
              Icons.loop,
            ), // Bengali title with icon
            // Image Gallery
            if (animal.imageGallery.isNotEmpty) ...[
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'গ্যালারি', // Bengali title
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                    fontFamily: 'NotoSansBengali',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 150, // Slightly taller gallery
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: animal.imageGallery.length,
                  itemBuilder: (context, index) {
                    final imageUrl = animal.imageGallery[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: GestureDetector(
                        onTap: () {
                          // Show full-screen image when tapped
                          _showFullScreenImage(context, imageUrl);
                        },
                        child: Hero(
                          // Added Hero animation for smooth transition
                          tag: imageUrl, // Unique tag for each image
                          child: Container(
                            width: 140, // Wider gallery image
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.network(
                                imageUrl,
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (context, error, stackTrace) =>
                                        const Center(
                                          child: Icon(
                                            Icons.image,
                                            size: 60,
                                            color: Colors.grey,
                                          ),
                                        ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Helper widget for information sections
  Widget _buildInfoSection(String title, String content, IconData icon) {
    if (content.isEmpty)
      return const SizedBox.shrink(); // Don't show if content is empty

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white, // White card background
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    size: 30,
                    color: Colors.green.shade700,
                  ), // Colorful icon
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo, // Darker text for title
                      fontFamily: 'NotoSansBengali',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                content,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontFamily: 'NotoSansBengali',
                ),
                textAlign: TextAlign.justify, // Justify text for neatness
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget for conservation status badge
  Widget _buildStatusBadge(String status) {
    Color badgeColor;
    String badgeText;
    IconData badgeIcon;

    switch (status) {
      case 'অতি বিপন্ন':
        badgeColor = Colors.orange.shade700;
        badgeText = 'অতি বিপন্ন!'; // Bengali for Endangered
        badgeIcon = Icons.warning_rounded;
        break;
      case 'সংরক্ষিত':
        badgeColor = Colors.yellow.shade800;
        badgeText = 'সংরক্ষিত'; // Bengali for Near Threatened
        badgeIcon = Icons.info_rounded;
        break;
      case 'আংশিক বিপন্ন':
        badgeColor = Colors.red.shade700;
        badgeText = 'আংশিক বিপন্ন'; // Bengali for Least Concern
        badgeIcon = Icons.check_circle_rounded;
        break;
      case 'সাধারণ':
        badgeColor = Colors.green.shade700;
        badgeText = 'সাধারণ'; // Bengali for Least Concern
        badgeIcon = Icons.check_circle_rounded;
        break;
      case 'হুমকির মুখে':
        badgeColor = Colors.red.shade900;
        badgeText = 'হুমকির মুখে'; // Bengali for Least Concern
        badgeIcon = Icons.check_circle_rounded;
        break;
      default:
        badgeColor = Colors.green.shade700;
        badgeText = 'সাধারণ'; // Bengali for Unknown
        badgeIcon = Icons.help_outline_rounded;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        decoration: BoxDecoration(
          color: badgeColor.withOpacity(
            0.2,
          ), // Lighter background for the badge
          borderRadius: BorderRadius.circular(30), // Rounded corners
          border: Border.all(color: badgeColor, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(badgeIcon, color: badgeColor, size: 28),
            const SizedBox(width: 8),
            Text(
              'অবস্থা: $badgeText', // Bengali text for status
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: badgeColor,
                fontFamily: 'NotoSansBengali',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show full-screen image
  void _showFullScreenImage(BuildContext context, String imageUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (_) => Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.black,
                iconTheme: const IconThemeData(color: Colors.white),
              ),
              body: Center(
                child: InteractiveViewer(
                  panEnabled: true, // Enable panning
                  boundaryMargin: const EdgeInsets.all(80),
                  minScale: 0.5,
                  maxScale: 4,
                  child: Hero(
                    tag: imageUrl, // Match the tag for Hero animation
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.contain,
                      errorBuilder:
                          (context, error, stackTrace) => const Center(
                            child: Icon(
                              Icons.broken_image,
                              size: 100,
                              color: Colors.red,
                            ),
                          ),
                    ),
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
