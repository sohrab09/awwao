import 'package:flutter/material.dart';
import 'package:awwao/classes/categories.dart';
import 'package:awwao/screens/category_details_screen.dart';

class CategoryCard extends StatelessWidget {
  final Categories category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the CategoryDetailsScreen when tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryDetailsScreen(category: category),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(category.icon, size: 40, color: Colors.green[700]),
            ),
            const SizedBox(height: 12),
            Text(
              category.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
