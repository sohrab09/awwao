import 'package:awwao/screens/sub_category_details.dart';
import 'package:flutter/material.dart';
import 'package:awwao/classes/categories.dart';

class SubCategoryCard extends StatelessWidget {
  final SubCategory subCategory;
  final String categoryType;
  final bool hasSound;
  final int index;

  const SubCategoryCard({
    super.key,
    required this.subCategory,
    required this.categoryType,
    required this.hasSound,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => SubCategoryDetailScreen(
                    subCategory: subCategory,
                    categoryType: categoryType,
                    hasSound: hasSound,
                  ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 160,
                    color: _getCategoryColor(categoryType).withOpacity(0.2),
                    child: Image.network(
                      subCategory.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 160,
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: _getCategoryColor(categoryType),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '#${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Content section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subCategory.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildInfoRow(Icons.home, 'বাসস্থান', subCategory.habitat),
                  const SizedBox(height: 8),
                  _buildInfoRow(
                    Icons.restaurant,
                    'খাদ্যাভ্যাস',
                    subCategory.foodHabit,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text(
                            'বিস্তারিত দেখুন',
                            style: TextStyle(
                              color: _getCategoryColor(categoryType),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward,
                            size: 16,
                            color: _getCategoryColor(categoryType),
                          ),
                        ],
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

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
        Expanded(
          child: Text(value, style: const TextStyle(color: Colors.black87)),
        ),
      ],
    );
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
      default:
        return Colors.purple;
    }
  }
}
