import 'package:flutter/material.dart';
import 'dart:math' as math;

class TasbeehScreen extends StatefulWidget {
  const TasbeehScreen({super.key});

  @override
  State<TasbeehScreen> createState() => _TasbeehScreenState();
}

class _TasbeehScreenState extends State<TasbeehScreen>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  bool _vibrateOnIncrement = true;
  bool _soundOnIncrement = false;
  bool _showSettings = false;
  late AnimationController _animationController;
  late Animation<double> _animation;
  int _currentGoal = 33; // Default goal (33 counts is common in tasbeeh)
  List<int> _availableGoals = [33, 99, 100, 500, 1000];

  // List of background colors to cycle through
  final List<Color> _backgroundColors = [
    const Color(0xFF81C784), // Green
    const Color(0xFF64B5F6), // Blue
    const Color(0xFFFFB74D), // Orange
    const Color(0xFFBA68C8), // Purple
    const Color(0xFF4FC3F7), // Light Blue
    const Color(0xFFAED581), // Light Green
  ];

  int _backgroundColorIndex = 0;

  // Achievement tracking
  int _totalAllTimeCounts = 0;
  bool _achievementUnlocked = false;
  String _achievementMessage = '';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    _animationController.forward(from: 0.0);
    setState(() {
      _counter++;
      _totalAllTimeCounts++;

      // Change background color when reaching goal
      if (_counter == _currentGoal) {
        _backgroundColorIndex =
            (_backgroundColorIndex + 1) % _backgroundColors.length;
        _showCelebration();
      }

      // Check for achievements
      _checkAchievements();
    });
  }

  void _checkAchievements() {
    if (_totalAllTimeCounts >= 100 && !_achievementUnlocked) {
      setState(() {
        _achievementUnlocked = true;
        _achievementMessage = 'Wow! You counted 100 times!';
      });
      // Show achievement popup
      Future.delayed(const Duration(seconds: 1), () {
        _showAchievementDialog();
      });
    }
  }

  void _showAchievementDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Row(
            children: [
              Icon(Icons.emoji_events, color: Colors.amber, size: 30),
              SizedBox(width: 10),
              Text('Achievement Unlocked!'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Image.asset(
                'assets/images/trophy.png',
                height: 100,
                errorBuilder:
                    (context, error, stackTrace) => const Icon(
                      Icons.emoji_events,
                      size: 100,
                      color: Colors.amber,
                    ),
              ),
              const SizedBox(height: 20),
              Text(
                _achievementMessage,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Keep up the good work!',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Yay!', style: TextStyle(fontSize: 18)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showCelebration() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      '🎉 Great Job! 🎉',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'You completed $_currentGoal counts!',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            _resetCounter();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            'Reset',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            'Continue',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _toggleSettings() {
    setState(() {
      _showSettings = !_showSettings;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'ডিজিটাল তাসবীহ',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 3.0,
                color: Color(0xFF000000),
              ),
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: _toggleSettings,
            tooltip: 'Settings',
          ),
        ],
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              _backgroundColors[_backgroundColorIndex],
              _backgroundColors[_backgroundColorIndex].withOpacity(0.7),
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Main content
              Column(
                children: [
                  // Goal indicator
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.flag, color: Colors.teal),
                              const SizedBox(width: 8),
                              Text(
                                'Goal: $_counter/$_currentGoal',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Progress indicator
                        SizedBox(
                          width: 220,
                          height: 220,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Progress background
                              Container(
                                width: 220,
                                height: 220,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(0.2),
                                ),
                              ),
                              // Progress bar
                              SizedBox(
                                width: 220,
                                height: 220,
                                child: CircularProgressIndicator(
                                  value: _counter / _currentGoal,
                                  strokeWidth: 15,
                                  backgroundColor: Colors.white.withOpacity(
                                    0.3,
                                  ),
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                ),
                              ),
                              // Counter display
                              ScaleTransition(
                                scale: _animation,
                                child: Container(
                                  width: 180,
                                  height: 180,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      _counter.toString(),
                                      style: const TextStyle(
                                        fontSize: 70,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 50),

                        // Counter button
                        GestureDetector(
                          onTap: _incrementCounter,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                size: 50,
                                color: Colors.teal,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Reset button
                        TextButton.icon(
                          onPressed: _resetCounter,
                          icon: const Icon(Icons.refresh, color: Colors.white),
                          label: const Text(
                            'Reset',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.teal.withOpacity(0.3),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Settings panel
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                bottom: _showSettings ? 0 : -320,
                left: 0,
                right: 0,
                // ...existing code...
                child: Container(
                  height: 320,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    // <-- Add this wrapper
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Settings',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: _toggleSettings,
                            ),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(height: 10),
                        const Text(
                          'Select Goal',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 10,
                          children:
                              _availableGoals
                                  .map(
                                    (goal) => ChoiceChip(
                                      label: Text('$goal'),
                                      selected: _currentGoal == goal,
                                      onSelected: (selected) {
                                        if (selected) {
                                          setState(() {
                                            _currentGoal = goal;
                                          });
                                        }
                                      },
                                      backgroundColor: Colors.grey.shade200,
                                      selectedColor: Colors.teal,
                                      labelStyle: TextStyle(
                                        color:
                                            _currentGoal == goal
                                                ? Colors.white
                                                : Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                    ),
                                  )
                                  .toList(),
                        ),
                        const SizedBox(height: 20),
                        SwitchListTile(
                          title: const Row(
                            children: [
                              Icon(Icons.vibration, color: Colors.teal),
                              SizedBox(width: 10),
                              Text('Vibration', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          value: _vibrateOnIncrement,
                          onChanged: (bool value) {
                            setState(() {
                              _vibrateOnIncrement = value;
                            });
                          },
                          activeColor: Colors.teal,
                        ),
                        SwitchListTile(
                          title: const Row(
                            children: [
                              Icon(Icons.volume_up, color: Colors.teal),
                              SizedBox(width: 10),
                              Text('Sound', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          value: _soundOnIncrement,
                          onChanged: (bool value) {
                            setState(() {
                              _soundOnIncrement = value;
                            });
                          },
                          activeColor: Colors.teal,
                        ),
                      ],
                    ),
                  ),
                ),
                // ...existing code...
              ),

              // Floating bubbles animation
              ...List.generate(
                10,
                (index) => Positioned(
                  left: (MediaQuery.of(context).size.width / 10) * index,
                  top:
                      (MediaQuery.of(context).size.height / 10) *
                      (math.Random().nextDouble() * 10),
                  child: _buildAnimatedBubble(index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedBubble(int index) {
    final size = 20.0 + (index % 4) * 10.0;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            math.sin((index + 1) * 0.4 + _counter * 0.1) * 20,
            math.cos((index + 1) * 0.6 + _counter * 0.1) * 20,
          ),
          child: Opacity(
            opacity: 0.4,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
