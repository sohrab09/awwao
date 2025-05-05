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

  FeaturedItem({
    required this.title,
    required this.description,
    required this.color,
    required this.icon,
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
  int _hoveredCategoryIndex = -1;

  final Color _primaryColor = const Color(0xFF4CAF50);
  final Color _accentColor = const Color(0xFFFFEB3B);

  // List of featured items
  final List _featuredItems = [
    FeaturedItem(
      title: 'পাখি',
      description: 'পাখি সম্পর্কে জানুন',
      color: const Color(0xFFFFC107), // Amber
      icon: FontAwesomeIcons.dove,
    ),
    FeaturedItem(
      title: 'প্রাণী',
      description: 'প্রাণী সম্পর্কে জানুন',
      color: const Color(0xFF7C4DFF), // Deep Purple Accent
      icon: Icons.pets,
    ),
    FeaturedItem(
      title: 'গাছ',
      description: 'গাছ সম্পর্কে জানুন',
      color: const Color(0xFF4CAF50), // Green
      icon: Icons.grass,
    ),
    FeaturedItem(
      title: 'মাছ',
      description: 'মাছ সম্পর্কে জানুন',
      color: const Color(0xFF00BCD4), // Cyan
      icon: FontAwesomeIcons.fish,
    ),
    FeaturedItem(
      title: 'ফুল',
      description: 'ফুল সম্পর্কে জানুন',
      color: const Color(0xFFFF69B4), // Hot Pink
      icon: Icons.local_florist,
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
    // Get the bottom padding to account for system navigation bar
    final bottomPadding = MediaQuery.of(context).padding.bottom;

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
              // Sky background with moving clouds
              _buildAnimatedBackground(),

              // Main content
              CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  // App Bar with animated character
                  _buildAnimatedAppBar(),

                  // Featured carousel
                  SliverToBoxAdapter(child: _buildFeaturedCarousel()),

                  // Category header
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

                  // Categories grid
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: _buildCategoriesGrid(),
                  ),

                  // Bottom spacing to accommodate navigation bar
                  SliverToBoxAdapter(
                    child: SizedBox(height: 80 + bottomPadding),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedBackground() {
    return AnimatedBuilder(
      animation: _cloudAnimationController,
      builder: (context, child) {
        return Stack(
          children: [
            // Blue sky gradient behind clouds
            Container(
              height: 200,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF90CAF9), // Light blue
                    Color(0x0090CAF9), // Fade to transparent
                  ],
                ),
              ),
            ),

            // Cloud 1
            Positioned(
              top: 30,
              left:
                  -60 +
                  (MediaQuery.of(context).size.width + 120) *
                      _cloudAnimationController.value,
              child: _buildCloud(80, 50),
            ),

            // Cloud 2
            Positioned(
              top: 90,
              left:
                  -80 +
                  (MediaQuery.of(context).size.width + 160) *
                      ((_cloudAnimationController.value + 0.3) % 1.0),
              child: _buildCloud(100, 60),
            ),

            // Cloud 3
            Positioned(
              top: 10,
              left:
                  -40 +
                  (MediaQuery.of(context).size.width + 80) *
                      ((_cloudAnimationController.value + 0.6) % 1.0),
              child: _buildCloud(60, 40),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCloud(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(height / 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
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
          height: 180,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: _featuredItems.length,
            itemBuilder: (context, index) {
              return _buildFeaturedCard(
                _featuredItems[index],
                _currentPage == index,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
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

  Widget _buildFeaturedCard(FeaturedItem item, bool isActive) {
    return AnimatedScale(
      scale: isActive ? 1.0 : 0.9,
      duration: const Duration(milliseconds: 300),
      child: Container(
        margin: const EdgeInsets.fromLTRB(8, 8, 8, 12),
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
                padding: const EdgeInsets.all(24),
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
                          const SizedBox(height: 16),
                          Text(
                            item.description,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
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
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(item.icon, size: 40, color: Colors.white),
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

  SliverGrid _buildCategoriesGrid() {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.85,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        final category = learningCategories[index];
        return _buildCategoryItem(category, index);
      }, childCount: learningCategories.length),
    );
  }

  Widget _buildCategoryItem(LearningCategory category, int index) {
    final isHovered = _hoveredCategoryIndex == index;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, category.route);
      },
      onTapDown: (_) {
        setState(() {
          _hoveredCategoryIndex = index;
        });
      },
      onTapUp: (_) {
        Future.delayed(const Duration(milliseconds: 200), () {
          if (mounted) {
            setState(() {
              _hoveredCategoryIndex = -1;
            });
          }
        });
      },
      onTapCancel: () {
        setState(() {
          _hoveredCategoryIndex = -1;
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
              color: category.color.withOpacity(isHovered ? 0.4 : 0.2),
              blurRadius: isHovered ? 10 : 5,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // We'll handle the image part with a placeholder since we don't have the actual images
            Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: category.color.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(category.icon, fit: BoxFit.cover),
              ),
            ),
            Text(
              category.title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: category.color,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              category.description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10, color: Colors.grey[600]),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
