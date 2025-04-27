import 'package:awwao/screens/sub_category_card.dart';
import 'package:flutter/material.dart';
import 'package:awwao/classes/categories.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final Categories category;

  const CategoryDetailsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _getCategoryColor(category.category),
        title: Text(
          category.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Category Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
            decoration: BoxDecoration(
              color: _getCategoryColor(category.category),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(
                    category.icon,
                    size: 40,
                    color: _getCategoryColor(category.category),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '${category.name} সম্পর্কে জানুন',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${category.subCategories.length}টি ${category.name.toLowerCase()} এর তথ্য রয়েছে',
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          ),

          // Subcategories List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: category.subCategories.length,
              itemBuilder: (context, index) {
                final subCategory = category.subCategories[index];
                return SubCategoryCard(
                  subCategory: subCategory,
                  categoryType: category.category,
                  hasSound: category.hasSound,
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
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
      case 'flower':
        return Colors.pink;
      default:
        return Colors.purple;
    }
  }
}
