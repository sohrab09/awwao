import 'package:awwao/classes/learning_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class FeaturedItem {
  final String title;
  final String description;
  final Color color;
  final IconData icon;
  final String route;

  FeaturedItem({
    required this.title,
    required this.description,
    required this.color,
    required this.icon,
    required this.route,
  });
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _backgroundAnimationController;
  late AnimationController _characterAnimationController;
  late AnimationController _cloudAnimationController;
  late AnimationController _carouselController;
  late PageController _pageController;
  int _currentPage = 0;

  // Selected category for animation
  int _hoveredSubcategoryIndex = -1;
  int _selectedMainCategoryIndex = 0;

  final Color _primaryColor = const Color(0xFF4CAF50);
  final Color _accentColor = const Color(0xFFFFEB3B);

  // List of featured items
  final List _featuredItems = [
    FeaturedItem(
      title: 'পাখি',
      description: 'পাখি সম্পর্কে জানুন',
      color: const Color(0xFFFFC107), // Amber
      icon: FontAwesomeIcons.dove,
      route: '/birds',
    ),
    FeaturedItem(
      title: 'প্রাণী',
      description: 'প্রাণী সম্পর্কে জানুন',
      color: const Color(0xFF7C4DFF), // Deep Purple Accent
      icon: Icons.pets,
      route: '/animals',
    ),
    FeaturedItem(
      title: 'গাছ',
      description: 'গাছ সম্পর্কে জানুন',
      color: const Color(0xFF4CAF50), // Green
      icon: Icons.grass,
      route: '/trees',
    ),
    FeaturedItem(
      title: 'মাছ',
      description: 'মাছ সম্পর্কে জানুন',
      color: const Color(0xFF00BCD4), // Cyan
      icon: FontAwesomeIcons.fish,
      route: '/fish',
    ),
    FeaturedItem(
      title: 'ফুল',
      description: 'ফুল সম্পর্কে জানুন',
      color: const Color(0xFFFF69B4), // Hot Pink
      icon: Icons.local_florist,
      route: '/flowers',
    ),
  ];

  @override
  void initState() {
    super.initState();

    // Set system UI overlay style
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    _backgroundAnimationController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    _characterAnimationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _cloudAnimationController = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    )..repeat();

    _carouselController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _pageController = PageController(viewportFraction: 0.85, initialPage: 0);
  }

  @override
  void dispose() {
    _backgroundAnimationController.dispose();
    _characterAnimationController.dispose();
    _cloudAnimationController.dispose();
    _carouselController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          bottom:
              false, // Don't apply safe area at bottom since we'll handle it manually
          child: Stack(
            children: [
              // Main content
              CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  // App Bar with animated character
                  _buildAnimatedAppBar(),

                  // Featured carousel
                  SliverToBoxAdapter(child: _buildFeaturedCarousel()),

                  // Main Categories header
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: _accentColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'আমরা শিখবো',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              height: 2,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    _accentColor,
                                    _accentColor.withOpacity(0.1),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Main Categories row
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 110,
                      child: _buildMainCategoriesRow(),
                    ),
                  ),

                  // Subcategories header
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: mainCategories[_selectedMainCategoryIndex]
                                  .color
                                  .withOpacity(0.8),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              mainCategories[_selectedMainCategoryIndex].title,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              height: 2,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    mainCategories[_selectedMainCategoryIndex]
                                        .color,
                                    mainCategories[_selectedMainCategoryIndex]
                                        .color
                                        .withOpacity(0.1),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Subcategories grid
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: _buildSubcategoriesGrid(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedAppBar() {
    return SliverAppBar(
      expandedHeight: 120,
      backgroundColor: Colors.transparent,
      elevation: 0,
      pinned: false,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Row(
            children: [
              // App logo and name
              Row(
                children: [
                  Hero(
                    tag: 'app_logo',
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.school,
                        size: 32,
                        color: Color(0xFF388E3C),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'ইশকুল',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black26,
                              blurRadius: 4.0,
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'জ্ঞানের রাজ্যে তোমাকে স্বাগতম',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black26,
                                blurRadius: 2.0,
                                offset: Offset(0.5, 0.5),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturedCarousel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Text(
            'আজকের বিশেষ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Colors.black26,
                  blurRadius: 2.0,
                  offset: Offset(1, 1),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 200, // Increased from 180 to 200
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: _featuredItems.length,
            itemBuilder: (context, index) {
              final item = _featuredItems[index];
              final isActive = _currentPage == index;

              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, item.route);
                },
                child: _buildFeaturedCard(item, isActive),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8), // Reduced from 16 to 8
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _featuredItems.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 16 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color:
                      _currentPage == index
                          ? _accentColor
                          : Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMainCategoriesRow() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      scrollDirection: Axis.horizontal,
      itemCount: mainCategories.length,
      itemBuilder: (context, index) {
        final category = mainCategories[index];
        final isSelected = _selectedMainCategoryIndex == index;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedMainCategoryIndex = index;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.only(right: 16),
            width: 90,
            decoration: BoxDecoration(
              color: isSelected ? category.color : Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: category.color.withOpacity(isSelected ? 0.4 : 0.2),
                  blurRadius: isSelected ? 8 : 4,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color:
                        isSelected
                            ? Colors.white.withOpacity(0.3)
                            : category.color.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    category.icon,
                    fit: BoxFit.cover,
                    width: 30,
                    height: 30,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  category.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: isSelected ? Colors.white : category.color,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  SliverGrid _buildSubcategoriesGrid() {
    final selectedMainCategory = mainCategories[_selectedMainCategoryIndex];
    final subcategories = selectedMainCategory.subCategories;

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        final subcategory = subcategories[index];
        return _buildSubcategoryItem(subcategory, index);
      }, childCount: subcategories.length),
    );
  }

  Widget _buildFeaturedCard(FeaturedItem item, bool isActive) {
    return AnimatedScale(
      scale: isActive ? 1.0 : 0.9,
      duration: const Duration(milliseconds: 300),
      child: Container(
        margin: const EdgeInsets.fromLTRB(
          8,
          8,
          8,
          8,
        ), // Reduced bottom margin from 12 to 8
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [item.color, item.color.withOpacity(0.8)],
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: item.color.withOpacity(0.4),
              blurRadius: isActive ? 10 : 5,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              // Background decoration
              Positioned(
                right: -20,
                bottom: -20,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                left: -10,
                top: -10,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.all(20), // Reduced from 24 to 20
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              item.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12), // Reduced from 16 to 12
                          Text(
                            item.description,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20, // Reduced from 22 to 20
                            ),
                          ),
                          const SizedBox(height: 12), // Reduced from 16 to 12
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12, // Reduced from 16 to 12
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'দেখি',
                              style: TextStyle(
                                color: item.color,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(
                        10,
                      ), // Reduced from 12 to 10
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        item.icon,
                        size: 36,
                        color: Colors.white,
                      ), // Reduced from 40 to 36
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubcategoryItem(SubCategory subcategory, int index) {
    final isHovered = _hoveredSubcategoryIndex == index;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, subcategory.route);
      },
      onTapDown: (_) {
        setState(() {
          _hoveredSubcategoryIndex = index;
        });
      },
      onTapUp: (_) {
        Future.delayed(const Duration(milliseconds: 200), () {
          if (mounted) {
            setState(() {
              _hoveredSubcategoryIndex = -1;
            });
          }
        });
      },
      onTapCancel: () {
        setState(() {
          _hoveredSubcategoryIndex = -1;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform:
            isHovered ? (Matrix4.identity()..scale(1.05)) : Matrix4.identity(),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: subcategory.color.withOpacity(isHovered ? 0.4 : 0.2),
              blurRadius: isHovered ? 10 : 5,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: subcategory.color.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                ),
                child: Center(
                  child: Text(
                    '${mainCategories[_selectedMainCategoryIndex].position}.${subcategory.position}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: subcategory.color,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: subcategory.color.withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            subcategory.icon,
                            fit: BoxFit.cover,
                            width: 35,
                            height: 35,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              subcategory.title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: subcategory.color,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              subcategory.description,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
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
}
