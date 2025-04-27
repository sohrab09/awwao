import 'package:flutter/material.dart';
import 'package:awwao/classes/categories.dart';

class SubCategoryDetailScreen extends StatelessWidget {
  final SubCategory subCategory;
  final String categoryType;
  final bool hasSound;

  const SubCategoryDetailScreen({
    super.key,
    required this.subCategory,
    required this.categoryType,
    this.hasSound = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar with image
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            backgroundColor: _getCategoryColor(categoryType),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                subCategory.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black45,
                      offset: Offset(1.0, 1.0),
                    ),
                  ],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Replace icon background with image
                  Image.asset(subCategory.imageUrl, fit: BoxFit.cover),

                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                        stops: const [0.7, 1.0],
                      ),
                    ),
                  ),
                  // Favorite and Sound icons
                  Positioned(
                    top: 40,
                    right: 16,
                    child: Row(
                      children: [
                        if (hasSound)
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up,
                              color: Colors.white,
                              size: 28,
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('প্রাণীর শব্দ চালু হবে'),
                                ),
                              );
                            },
                          ),
                        const SizedBox(width: 10),
                        IconButton(
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('পছন্দের তালিকায় যোগ করা হবে'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Info card
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'মৌলিক তথ্য',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildDetailRow(
                            Icons.category,
                            'শ্রেণী',
                            _getCategoryName(),
                          ),
                          const Divider(height: 24),
                          _buildDetailRow(
                            Icons.home,
                            'বাসস্থান',
                            subCategory.habitat,
                          ),
                          const Divider(height: 24),
                          _buildDetailRow(
                            Icons.restaurant,
                            'খাদ্যাভ্যাস',
                            subCategory.foodHabit,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Description section
                  const Text(
                    'বিবরণ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _generateDescription(),
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),

                  const SizedBox(height: 24),

                  // Features section
                  const Text(
                    'বৈশিষ্ট্য',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _buildFeatureItem(
                    icon: Icons.star,
                    title: _getFirstFeatureTitle(),
                    description: _getFirstFeatureDescription(),
                    color: _getCategoryColor(categoryType),
                  ),
                  const SizedBox(height: 12),
                  _buildFeatureItem(
                    icon: Icons.visibility,
                    title: _getSecondFeatureTitle(),
                    description: _getSecondFeatureDescription(),
                    color: _getCategoryColor(categoryType),
                  ),
                  const SizedBox(height: 12),

                  // Image Gallery Section
                  if (subCategory.imageUrls.isNotEmpty) ...[
                    const Text(
                      'ছবির গ্যালারি',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 150,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: subCategory.imageUrls.length,
                        separatorBuilder:
                            (context, index) => const SizedBox(width: 16),
                        itemBuilder: (context, index) {
                          final imageUrl = subCategory.imageUrls[index];
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              width: 200,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 8,
                                    offset: const Offset(2, 2),
                                  ),
                                ],
                              ),
                              child: Image.asset(imageUrl, fit: BoxFit.cover),
                            ),
                          );
                        },
                      ),
                    ),
                  ] else ...[
                    const Text(
                      'কোনো ছবি উপলব্ধ নয়',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: _getCategoryColor(categoryType).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: _getCategoryColor(categoryType), size: 24),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(color: Colors.grey[800], height: 1.5),
                ),
              ],
            ),
          ),
        ], // Image Gallery Section
      ),
    );
  }

  String _getCategoryName() {
    switch (categoryType) {
      case 'bird':
        return 'পাখি';
      case 'animal':
        return 'প্রাণী';
      case 'fish':
        return 'মাছ';
      case 'plant':
        return 'গাছ';
      case 'flower':
        return 'ফুল';
      default:
        return '';
    }
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'bird':
        return Colors.blue;
      case 'animal':
        return Colors.orange;
      case 'fish':
        return Colors.teal;
      case 'plant':
        return Colors.green;
      case 'flower':
        return Colors.pink;
      default:
        return Colors.purple;
    }
  }

  String _generateDescription() {
    // Generate placeholder descriptions based on category type and name
    switch (categoryType) {
      case 'bird':
        return '${subCategory.name} বাংলাদেশের একটি পরিচিত পাখি। এরা ${subCategory.habitat} অঞ্চলে বাস করে এবং প্রধানত ${subCategory.foodHabit} খেয়ে জীবনধারণ করে। এদের ডানা ও পালক থাকে। এরা বাতাসে উড়তে পারে এবং বাসা তৈরি করে বংশবৃদ্ধি করে। বিভিন্ন ঋতুতে এদের আচরণে পরিবর্তন দেখা যায়।';
      case 'animal':
        return '${subCategory.name} হলো ${subCategory.habitat} এলাকায় বসবাসকারী একটি স্তন্যপায়ী প্রাণী। এরা ${subCategory.foodHabit} হিসেবে পরিচিত। বাংলাদেশের বিভিন্ন অঞ্চলে এদের দেখা যায়। এদের বিশেষ বৈশিষ্ট্য হলো এরা তাদের বাচ্চাদের স্তন্যপান করায়। প্রজনন, বংশবিস্তার এবং পরিবেশের সাথে খাপ খাইয়ে নেওয়ার ক্ষমতা রয়েছে।';
      case 'fish':
        return '${subCategory.name} বাংলাদেশের জলজ প্রাণীদের মধ্যে অন্যতম। এই মাছ ${subCategory.habitat} এলাকায় বসবাস করে। এরা সাধারণত ${subCategory.foodHabit} খেয়ে বেঁচে থাকে। এদের শরীরে আঁশ থাকে এবং ফুলকা দিয়ে শ্বাস নেয়। জলের নিচে বাস করে এবং ডিম দিয়ে বংশবিস্তার করে।';
      case 'plant':
        return '${subCategory.name} বাংলাদেশের উদ্ভিদ জগতের অন্যতম প্রজাতি। এই গাছ ${subCategory.habitat} অঞ্চলে বেশি দেখা যায়। এরা সাধারণত ${subCategory.foodHabit} গ্রহণ করে বৃদ্ধি পায়। এদের শিকড়, কাণ্ড, পাতা, ফুল ও ফল রয়েছে। সালোকসংশ্লেষণ প্রক্রিয়ায় নিজের খাদ্য নিজেই তৈরি করে এবং পরিবেশকে সুন্দর ও সুস্থ রাখতে সাহায্য করে।';
      default:
        return 'বিস্তারিত তথ্য এখানে প্রদর্শিত হবে।';
    }
  }

  String _getFirstFeatureTitle() {
    switch (categoryType) {
      case 'bird':
        return 'উড়ন্ত বৈশিষ্ট্য';
      case 'animal':
        return 'শারীরিক গঠন';
      case 'fish':
        return 'জলজ জীবন';
      case 'plant':
        return 'বৃদ্ধি প্রক্রিয়া';
      case 'flower':
        return 'ফুলের গঠন';
      default:
        return 'প্রধান বৈশিষ্ট্য';
    }
  }

  String _getFirstFeatureDescription() {
    switch (categoryType) {
      case 'bird':
        return '${subCategory.name} এর ডানা রয়েছে যা তাদেরকে আকাশে উড়তে সাহায্য করে। তারা উড়ার সময় বিভিন্ন কৌশল ব্যবহার করে এবং বাতাসের প্রবাহ অনুসারে গতিপথ পরিবর্তন করতে পারে।';
      case 'animal':
        return '${subCategory.name} এর শরীরের গঠন তাদের ${subCategory.habitat} এর সাথে মানিয়ে নেওয়ার জন্য বিশেষভাবে অভিযোজিত। তাদের দৃঢ় পেশি এবং শক্তিশালী হাড়ের কাঠামো তাদের সুরক্ষা দেয়।';
      case 'fish':
        return '${subCategory.name} জলের নিচে শ্বাস নিতে ফুলকা ব্যবহার করে। তাদের শরীরের আকার জলে সহজে চলাফেরা করার জন্য স্ট্রিমলাইন করা।';
      case 'plant':
        return '${subCategory.name} গাছের বৃদ্ধি মৌসুম অনুযায়ী পরিবর্তিত হয়। গ্রীষ্মকালে দ্রুত বৃদ্ধি পায় এবং শীতকালে বৃদ্ধি ধীর হয়ে যায়। গাছটি সূর্যালোক থেকে শক্তি সংগ্রহ করে।';
      case 'flower':
        return '${subCategory.name} যার গঠন হলো- বৃতি, দল, পুং এবং স্ত্রী অংশ। ফুলের বাইরের অংশ হলো বৃতি, যা সাধারণত সবুজ এবং ফুলের কুঁড়ি অবস্থায় ফুলকে রক্ষা করে।';
      default:
        return 'এই বৈশিষ্ট্য সম্পর্কে বিস্তারিত তথ্য এখানে দেখা যাবে।';
    }
  }

  String _getSecondFeatureTitle() {
    switch (categoryType) {
      case 'bird':
        return 'জীবনচক্র';
      case 'animal':
        return 'আচরণ বৈশিষ্ট্য';
      case 'fish':
        return 'প্রজনন প্রক্রিয়া';
      case 'plant':
        return 'ফলন ক্ষমতা';
      case 'flower':
        return 'বংশবৃদ্ধি প্রক্রিয়া';
      default:
        return 'অতিরিক্ত বৈশিষ্ট্য';
    }
  }

  String _getSecondFeatureDescription() {
    switch (categoryType) {
      case 'bird':
        return '${subCategory.name} বছরে একাধিকবার ডিম পাড়ে এবং নিজেরাই সেই ডিমে তা দেয়। বাচ্চারা বড় হলে তাদেরকে উড়তে শেখায় এবং খাবার খুঁজতে শেখায়।';
      case 'animal':
        return '${subCategory.name} এর আচরণে দেখা যায় যে তারা ${subCategory.foodHabit} খেতে পছন্দ করে। তারা দলবদ্ধভাবে থাকতে পছন্দ করে এবং নির্দিষ্ট সময়ে সক্রিয় হয়।';
      case 'fish':
        return '${subCategory.name} প্রজনন মৌসুমে বিশেষ এলাকায় যায় এবং সেখানে ডিম পাড়ে। পুরুষ মাছ সেই ডিমে শুক্রাণু দিয়ে নিষিক্ত করে। এভাবে নতুন মাছের জন্ম হয়।';
      case 'plant':
        return '${subCategory.name} গাছে মৌসুম অনুযায়ী ফল ধরে। ফলের মধ্যে বীজ থাকে যা থেকে নতুন গাছের জন্ম হয়। এই গাছের ফল স্বাস্থ্যকর এবং পুষ্টিকর।';
      case 'flower':
        return '${subCategory.name} ফুলের বংশবৃদ্ধি প্রক্রিয়া বিশেষভাবে আকর্ষণীয়। ফুলের পাপড়ি এবং গর্ভাশয় মিলিত হয়ে নতুন বীজ উৎপাদন করে।';
      default:
        return 'এই বৈশিষ্ট্য সম্পর্কে বিস্তারিত তথ্য এখানে দেখা যাবে।';
    }
  }
}
