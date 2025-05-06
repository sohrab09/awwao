import 'package:awwao/classes/learning_category.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  final Color _primaryColor = const Color(0xFF4CAF50);

  @override
  Widget build(BuildContext context) {
    final List<SubCategoryWithParent> allSubcategories = [];

    for (var mainCategory in mainCategories) {
      for (var subCategory in mainCategory.subCategories) {
        allSubcategories.add(
          SubCategoryWithParent(
            subCategory: subCategory,
            parentColor: mainCategory.color,
            parentTitle: mainCategory.title,
          ),
        );
      }
    }

    return Scaffold(
      body: Container(
        // Simple gradient background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(
                0xFF81C784,
              ).withOpacity(0.8), // Light green with transparency
              _primaryColor, // Base green
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Grid of all subcategories
              Expanded(
                child: _buildSubcategoriesGrid(allSubcategories, context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubcategoriesGrid(
    List<SubCategoryWithParent> subcategories,
    BuildContext context,
  ) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: subcategories.length,
      itemBuilder: (context, index) {
        return SubCategoryTile(item: subcategories[index]);
      },
    );
  }
}

class SubCategoryWithParent {
  final SubCategory subCategory;
  final Color parentColor;
  final String parentTitle;

  SubCategoryWithParent({
    required this.subCategory,
    required this.parentColor,
    required this.parentTitle,
  });
}

class SubCategoryTile extends StatelessWidget {
  final SubCategoryWithParent item;

  const SubCategoryTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(item.subCategory.route, arguments: item.subCategory);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: item.subCategory.color.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Category badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: item.parentColor.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Text(
                item.parentTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon in colored circle
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: item.subCategory.color.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Image.asset(item.subCategory.icon),
                    ),
                    const SizedBox(height: 12),

                    // Title
                    Text(
                      item.subCategory.title,
                      style: TextStyle(
                        color: item.subCategory.color,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 6),

                    // Description
                    Text(
                      item.subCategory.description,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),

            // Play button
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: item.subCategory.color,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.play_circle_fill, color: Colors.white, size: 18),
                  SizedBox(width: 4),
                  Text(
                    'শুরু করুন',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
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
}
